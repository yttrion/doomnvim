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

welcome(){
    echo_with_color ${Red} "______ _____  ________  ___"
    echo_with_color ${Red} "|  _  \  _  ||  _  |  \/  |"
    echo_with_color ${Red} "| | | | | | || | | | |\/| |"
    echo_with_color ${Red} "| |/ /\ \_/ /\ \_/ / |  | |"
    echo_with_color ${Red} "|___/  \___/  \___/\_|  |_/"
    echo_with_color ${Red} "           NVIM            "
    echo_with_color ${Red} "                           "
    echo_with_color ${Yellow} "Version:${version}   By: yttrion"

}

install_done(){
    echo ""
    echo_with_color ${Green}    "================================================================"
    echo_with_color ${Green}    "You are almost done. Start vim or neovim to install the plugins"
    echo_with_color ${Green}    "That's all folks. Thanks for installing doomnvim"
    echo_with_color ${Green}    "Enjoy."
    echo_with_color ${Green}    "================================================================"
}


check_all(){
    check_cmd 'git'
    check_cmd 'luarocks'
    check_cmd 'npm'
    check_cmd 'node'
    check_cmd 'curl'
    check_cmd 'unzip'
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
            --install|-i)
                welcome
                check_all
                backup_neovim
                install_done
                exit 0
                ;;
        esac
    else
        #Run normal commands
        welcome
        check_all
        backup_neovim
        install_done
    fi
}

main $@
# vim:
