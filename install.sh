#! /bin/sh

#==============================================
# install.sh --- install script for doomnvim
# Author: Pierre-Yves Douault
# License: MIT
#==============================================

# Code shamelessly stolen from SpaceVim
# check https://spacevim.org for more info

# Init option {{{
Color_off='\033[0m'       # Text Reset

# terminal color template {{{
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White
# }}}

# version
Version='0.1.0'
#System name
System="$(uname -s)"

# }}}

need_cmd () {
    if ! hash "$1" &>/dev/null; then
        error "Need '$1' (command not found)"
        exit 1
    fi
}

check_requirements(){
	info "Checking requirements"
	# Checks if git is installed again
	if hash "git" &>/dev/null; then
		git_version=$(git --version)
		success "Check requirements: ${git_version}"
	else
		warn "Check requirements : git"
	fi
	# Checks if neovim is installed
	if hash "nvim" &>/dev/null; then
		success "Check requirements nvim"
	else
		warn "Check requirements nvim"
	fi
	info "Checking true colors"
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh)"

}


msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "${Green}[✔]${Color_off} ${1}${2}"
}

info() {
    msg "${Blue}[+]${Color_off} ${1}${2}"
}

error() {
    msg "${Red}[X]${Color_off} ${1}${2}"
    exit 1
}

warn () {
    msg "${Yellow}[!]${Color_off} ${1}${2}"
}

echo_with_color () {
    printf '%b\n' "$1$2$Color_off" >&2
}



vim_backup(){
	if test -f "$HOME/.vimrc"; then
		mkdir $HOME/.vim_bak
		mv $HOME/.vim/* $HOME/vim_bak
		mv $HOME/.vimrc $HOME/vim_bak
		info "Your previous vim configuration is located at $HOME/.vim_bak"
	fi
}

#Update repo if alread installed
update_repo(){
	if [[ -d "$HOME/.doomnvim" ]]; then
		info "Updating doomnvim install"
		cd "$HOME/.doomnvim"
		git pull
		cd - > /dev/null 2>&1
		success "Successfully updated doomnvim"
	else
		info "Trying to clone doomnvim"
		git clone -q https://github.com/yttrion/doomnvim "$HOME/.doomnvim"
		if [ $? -eq 0 ]; then
			success "Successfully cloned doomnvim"
		else
			error "Failed to clone doomnvim"
			exit 0
		fi
	fi
}

install_neovim(){
	if [[ -d "$HOME/.config/nvim" ]]; then
		if [[ "$(readlink $HOME/.config/nvim)" =~ \.doomnvim$ ]]; then
			success "Installed doomnvim"
		else
			mv "$HOME/.config/nvim" "$HOME/.config/nvim_back"
			success "Neovim backup is in $HOME/.config/nvim_back"
			ln -s "$HOME/.doomnvim" "$HOME/.config/nvim"
			success "Installed doomnvim"
		fi
	else
		mkdir -p "$HOME/.config"
		ln -s "$HOME/.doomnvim" "$HOME/.config/nvim"
		success "Installed doomnvim"
	fi

}

install_vimplug(){
	if [[ ! -d "$HOME/.cache/vimfiles/repos/github.com/junegunn/plug.vim" ]]; then
		info "Installing vim-plug"
		git clone -q https://github.com/junegunn/vim-plug $HOME/.cache/vimfiles/repos/github.com/junegunn/vim-plug
		success "Successfully installed vim-plug"
	fi
}

#install_fonts(){}

welcome(){
	echo_with_color ${Red} "______    ______    ______  ____  ___"
	echo_with_color ${Red} "\\   _ \\   /  __  \\  /  __  \\ \\   \\/  |"
	echo_with_color ${Red} " | | | |  | |  | |  | |  | |  | |\\/| |"
	echo_with_color ${Red} " | | | |  | |  | |  | |  | |  | |  | |"
	echo_with_color ${Red} " | |/ /   \\  \\/  /  \\  \\/  /  \\ |  | |"
	echo_with_color ${Red} " |   /     \\    /    \\    /    \\|  | |"
	echo_with_color ${Red} " |  /       \\__/      \\__/         | |"
	echo_with_color ${Red} " | /                               \\ |"
	echo_with_color ${Red} " |/            NVIM                 \\|"
	echo_with_color ${Red} " 									  "
	echo_with_color ${Yellow} "Version:${version} 	By: Pierre-Yves Douault"

}


main(){
	if [ $# -gt 0 ]
	then
		case $1 in
			--check-requirements|-c)
				check_requirements
				exit 0
				;;
			--install|-i)
				welcome
				need_cmd 'git'
				update_repo
				install_neovim

				exit 0
				;;
			--help|-h)
				usage
				exit 0
				;;
			--version|-v)
				msg "${version}"
				exit 0
				;;
			--uninstall|-u)
				info "Trying to uninstall doomnvim"
				exit 0
				;;
		esac
	else
		#Run normal commands
		welcome
		need_cmd 'git'
		update_repo
		install_neovim
		install_vimplug
		#install_fonts
		check_requirements
	fi
}

main $@

# vim:set nofoldenable foldmethod=marker:
