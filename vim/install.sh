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
Version='0.1.82'
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
        git pull --no-edit
		cd - > /dev/null 2>&1
		success "Successfully updated doomnvim"
	else
		info "Cloning doomnvim"
		git clone -q https://github.com/yttrion/doomnvim "$HOME/.doomnvim"
		if [ $? -eq 0 ]; then
			success "Successfully cloned doomnvim"
		else
			error "Failed to clone doomnvim"
			exit 1
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

install_packagemanager(){
	if [[ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]]; then
		info "Installing package manager"
        git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
		success "Successfully installed package manager"
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
	echo_with_color ${Green} 	"================================================================"
	echo_with_color ${Green} 	"You are almost done. Start vim or neovim to install the plugins"
	echo_with_color ${Green}	"That's all folks. Thanks for installing doomnvim"
	echo_with_color ${Green} 	"Enjoy."
	echo_with_color ${Green} 	"================================================================"
}


check_all(){
	check_cmd 'git'
	check_cmd 'ctags'
	check_cmd 'npm'
	check_cmd 'node'
	check_cmd 'curl'
	check_cmd 'curl'
	check_cmd 'npm'
    check_cmd 'nvim'
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
		#install_packagemanager
		install_done
	fi
}

main $@

# vim:
