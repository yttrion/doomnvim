#!/usr/bin/bash
#==============================================
# install.sh --- install script for doomnvim
# Author: Pierre-Yves Douault
# License: MIT
#==============================================

# Code shamelessly stolen from SpaceVim installer
# check https://spacevim.org for more info

# Init option --------------------------------------------------{{{
Color_off='\033[0m'       # Text Reset

# terminal color template --------------------------------------{{{
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

# }}}

# version
Version='0.1.7'
#System name
System="$(uname -s)"

# }}}

need_cmd () {
    if ! hash "$1" &>/dev/null; then
        error "Need '$1' (command not found)"
        exit 1
    fi
}

check_cmd () {
	if ! type "$1" &> /dev/null; then
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
		info "Updating doomnvim..."
		cd "$HOME/.doomnvim"
        git reset --hard HEAD
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


backup_neovim(){
	if [[ -d "$HOME/.config/nvim" ]]; then
		if [[ "$(readlink $HOME/.config/nvim)" =~ \.doomnvim$ ]]; then
			success "Installed doomnvim"
		else
			mv "$HOME/.config/nvim" "$HOME/.config/nvim_bak"
			success "Neovim backup is in $HOME/.config/nvim_bak"
			ln -s "$HOME/.doomnvim" "$HOME/.config/nvim"
			success "Installed doomnvim"
		fi
	else
		mkdir -p "$HOME/.config"
		ln -s "$HOME/.doomnvim" "$HOME/.config/nvim"
		success "Installed doomnvim for neovim"
	fi

}

backup_vim(){
	if [[ -f "$HOME/.vimrc" ]]; then
		mv "$HOME/.vimrc" "$HOME/.vimrc_bak"
		success "Vim backup is in $HOME/.vimrc_bak"
	fi
	if [[ -d "$HOME/.vim" ]]; then
		if [[ "$(readlink $HOME/.vim)" =~ \.doomnvim$ ]]; then
			success "Installed doomnvim for vim"
		else
			mv "$HOME/.vim" "$HOME/.vim_bak"
			success ".vim/ backup is in $HOME/.vim_bak"
			ln -s "$HOME/.doomnvim" "$HOME/.vim"
			success "Installed doomnvim for vim"
		fi
	else
		ln -s "$HOME/.doomnvim" "$HOME/.vim"
		success "Installed doomnvim for vim"
	fi

}

install_neovim_nightly(){
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod u+x nvim.appimage
    mv nvim.appimage $HOME/.config/
    echo "alias 'nvim'=$HOME/.config/nvim.appimage" >> $HOME/.bashrc
    echo "alias 'nvim'=$HOME/.config/nvim.appimage" >> $HOME/.zshrc
    success "Successfully installed neovim nightly"
}


install_vimplug(){
	if [[ ! -d "$HOME/.cache/vimfiles/repos/github.com/junegunn/plug.vim" ]]; then
		info "Installing vim-plug"
		git clone -q https://github.com/junegunn/vim-plug $HOME/.cache/vimfiles/repos/github.com/junegunn/vim-plug
		success "Successfully installed vim-plug"
	fi
}


install_fonts(){
    if [[ ! -d "$HOME/.local/share/fonts" ]]; then
        mkdir -p $HOME/.local/share/fonts
    fi
    download_font "DejaVu Sans Mono Bold Oblique for Powerline.ttf"
    download_font "DejaVu Sans Mono Bold for Powerline.ttf"
    download_font "DejaVu Sans Mono Oblique for Powerline.ttf"
    download_font "DejaVu Sans Mono for Powerline.ttf"
    download_font "DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf"
    download_font "Ubuntu Mono derivative Powerline Nerd Font Complete.ttf"
    download_font "WEBDINGS.TTF"
    download_font "WINGDNG2.ttf"
    download_font "WINGDNG3.ttf"
    download_font "devicons.ttf"
    download_font "mtextra.ttf"
    download_font "symbol.ttf"
    download_font "wingding.ttf"
    info "Updating font cache, please wait ..."
    if [ $System == "Darwin" ];then
        if [ ! -e "$HOME/Library/Fonts" ];then
            mkdir "$HOME/Library/Fonts"
        fi
        cp $HOME/.local/share/fonts/* $HOME/Library/Fonts/
    else
        fc-cache -fv > /dev/null
        mkfontdir "$HOME/.local/share/fonts" > /dev/null
        mkfontscale "$HOME/.local/share/fonts" > /dev/null
    fi
    success "font cache done!"
}
download_font(){
	# TODO
	# 	- Must use own font manager
    url="https://raw.githubusercontent.com/wsdjeg/DotFiles/7a75a186c6db9ad6f02cafba8d4c7bc78f47304c/local/share/fonts/${1// /%20}"
    path="$HOME/.local/share/fonts/$1"
    # Clean up after https://github.com/SpaceVim/SpaceVim/issues/2532
    if [[ -f "$path" && ! -s "$path" ]]
    then
        rm "$path"
    fi
    if [[ -f "$path" ]]
    then
        success "Downloaded $1"
    else
        info "Downloading $1"
        curl -s -o "$path" "$url"
        success "Downloaded $1"
    fi
}

uninstall(){
	
	#VIM
	if [[ -d "$HOME/.vim" ]]; then
        if [[ "$(readlink $HOME/.vim)" =~ \.doomnvim$ ]]; then
            rm "$HOME/.vim"
            success "Uninstalled doomnvim for vim"
            if [[ -d "$HOME/.vim_bak" ]]; then
                mv "$HOME/.vim_bak" "$HOME/.vim"
                success "Recovered $HOME/.vim_bak backup"
            fi
        fi
    fi
    if [[ -f "$HOME/.vimrc_bak" ]]; then
        mv "$HOME/.vimrc_bak" "$HOME/.vimrc"
        success "Recovered $HOME/.vimrc_bak backup"
    fi
	
	#NEOVIM
    if [[ -d "$HOME/.config/nvim" ]]; then
        if [[ "$(readlink $HOME/.config/nvim)" =~ \.doomnvim$ ]]; then
            rm "$HOME/.config/nvim"
            success "Uninstalled doomnvim for neovim"
            if [[ -d "$HOME/.config/nvim_bak" ]]; then
                mv "$HOME/.config/nvim_bak" "$HOME/.config/nvim"
                success "Recovered $HOME/.config/nvim_bak backup"
            fi
        fi
    fi

	if  [[ -d "$HOME/.doomnvim" ]]; then
		rm -rf "$HOME/.doomnvim"
		success "Completely removed doomnvim"

	fi

}

welcome(){
	echo_with_color ${Red} "______ _____  ________  ___"
	echo_with_color ${Red} "|  _  \  _  ||  _  |  \/  |"
	echo_with_color ${Red} "| | | | | | || | | | |\/| |"
	echo_with_color ${Red} "| |/ /\ \_/ /\ \_/ / |  | |"
	echo_with_color ${Red} "|___/  \___/  \___/\_|  |_/"
	echo_with_color ${Red} "           NVIM            "
	echo_with_color ${Red} " 			               "
	echo_with_color ${Yellow} "Version:${version} 	By: Pierre-Yves Douault"

}

install_done(){
	echo ""
	echo_with_color ${Green} 	"================================================="
	echo_with_color ${Green} 	"You are almost done. Start vim or neovim to install the plugins"
	echo_with_color ${Green}	"That's all folks. Thanks for installing doomnvim"
	echo_with_color ${Green} 	"Enjoy."
	echo_with_color ${Green} 	"================================================="
}

helper(){
	info "doomnvim ${version} help"
	echo_with_color ${Green} "doomnvim installer"
	echo_with_color ${Green} "Usage ./install.sh [optn]"
	echo_with_color ${Green} "Possible values:"
	echo_with_color ${Yellow} "-u --update				Update doomnvim"
	echo_with_color ${Yellow} "-c --check-requirements			Check doomnvim requirements"
	echo_with_color ${Yellow} "-n --nightly				Install Neovim nightly appimage"
	echo_with_color ${Yellow} "-i --install				Install doomnvim"
	echo_with_color ${Yellow} "-h --help				Displays this message"
	echo_with_color ${Yellow} "-v --version				Echo doomnvim version"
	echo_with_color ${Yellow} "-x --uninstall				Uninstall doomnvim"
}

check_all(){
	check_cmd 'git'
	check_cmd 'ctags'
	check_cmd 'npm'
	check_cmd 'node'
	check_cmd 'curl'
	check_cmd 'curl'
	check_cmd 'npm'
}

main(){
	if [ $# -gt 0 ]
    then
        case $1 in
            --check-requirements|-c)
                check_requirements
                exit 0
                ;;
			--update|-u)
				update_repo
				exit 0
				;;
			--install|-i)
				welcome
				check_all
				update_repo
				if [ $# -eq 2 ]
				then
					case $2 in
						neovim)
							backup_neovim
							install_done
							exit 0
							;;
						vim)
							backup_vim
							install_done
							exit 0
					esac
				fi
				backup_vim
				backup_neovim
				exit 0
				;;
            --nightly|-n)
                welcome
                check_all
                update_repo
                backup_neovim
                backup_vim
                install_neovim_nightly
                install_done
                exit 0
                ;;
			--help|-h)
				helper
				exit 0
				;;
			--version|-v)
				msg "${version}"
				exit 0
				;;
			--uninstall|-x)
				info "Uninstalling doomnvim"
				uninstall
				echo_with_color ${Green} "Thanks for using doomnvim!"
				exit 0
				;;
		esac
	else
		#Run normal commands
		welcome
		check_all
		update_repo
		backup_neovim
		install_vimplug
		install_fonts
		check_requirements
		install_done
	fi
}

main $@

# vim:
