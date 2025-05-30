<div align="center">

# doomnvim

[Install](#install) • [Documentation](https://github.com/yttrion/doomnvim/blob/main/doc/doomnvim.txt) • [Screenshots](#screenshots)

![License](https://img.shields.io/github/license/yttrion/doomnvim?style=flat-square)
![Release](https://img.shields.io/github/v/release/yttrion/doomnvim?include_prereleases&style=flat-square)
![Neovim version](https://img.shields.io/badge/Neovim-0.10+-57A143?style=flat-square&logo=neovim)
![Latest commit](https://img.shields.io/github/last-commit/yttrion/doomnvim/dev?style=flat-square)
</div>

### Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Install](#install)
- [FAQ](#faq)
- [Screenshots](#screenshots)
- [Acknowledgements](#acknowledgements)

# Introduction
doomnvim is a vim-version of the [doom-emacs](https://github.com/hlissner/doom-emacs).
It aims to add useful features to stock neovim and also serves as my daily driver.

**doomnvim was made for neovim, it may not work as intended on vim**

**doomnvim works best with [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)**

## DISCLAIMER
[doomnvim](https://github.com/yttrion/doomnvim) is a project I started in october 2020.
Please checkout NTBBloodbath's [doom-nvim](https://github.com/NTBBloodbath/doom-nvim) as it has more features and is constantly updated.

# Features

- Curated defaults for vim/neovim
- Support for *many* languages (LSP/DSP/Linter/Formatter) with [mason.nvim](https://github.com/mason-org/mason.nvim)
- Mnemonic key binding
- Integration with `Telescope.nvim` 
- Most features of a text editor
- Written in Lua

# Install
## Prerequisites

doomnvim requires the following packages starting from version `2.0.0a` 

- neovim `v>=0.10`
- luarocks
- node
- npm
- python3
- unzip
- fzf


## Install doomnvim
Simply run the following command:

```bash
curl -sLf https://raw.githubusercontent.com/yttrion/doomnvim/main/install.sh | bash
```

After doomnvim is installed, run neovim and doomnvim will automatically install plugins
*doomnvim* might show some errors during the first launch, use the ':Mason' command and just restart it.

# Screenshots
<div align="center">
  <div>
    <img src="https://github.com/yttrion/doomnvim/blob/screens/doomnvim_dashboard.png?raw=true" width=100%>
  </div>
  <div>
    <img src="https://github.com/yttrion/doomnvim/blob/screens/doomnvim_floaterm.png?raw=true" width=49%>
    <img src="https://github.com/yttrion/doomnvim/blob/screens/doomnvim_multi.png?raw=true" width=49%>
  </div>
</div>

# Acknowledgements
- [doom-emacs](https://github.com/hlissner/doom-emacs)
- [SpaceVim](https://github.com/SpaceVim/SpaceVim)

## Plugins and colorschemes
Check `doomnvim.txt`
