"===========================================================
" dashboard configuration
" Author: Pierre-Yves Douault
" License: MIT
"===========================================================

lua <<EOF
local home = os.getenv('HOME')
local db = require('dashboard')
local ver = vim.api.nvim_get_var('doomnvim_version')
db.setup({
    theme = 'doom',
    config = {
        header = {
            "",
            "",
            "=================     ===============     ===============   ========  ========",
            "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
            "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
            "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
            "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
            "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
            "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
            "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
            "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
            "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
            "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
            "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
            "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
            "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
            "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
            "||.=='    _-'                                                     `' |  /==.||",
            "=='    _-'                 _   _ _   _ ________  ___                  \\/   `==",
            "\\   _-'                   | \\ | | | | |_   _|  \\/  |                   `-_   /",
            " `''                      |  \\| | | | | | | | .  . |                      ``' ",
            "                          | . ` | | | | | | | |\\/| |                          ",   
            "                          | |\\  \\ \\_/ /_| |_| |  | |                          ",  
            "                          \\_| \\_/\\___/ \\___/\\_|  |_/                          ",           
            "",
            ""},
        center = {
            {
                icon = '  ',
                desc = 'Command history                         ',
                desc_hl = 'String',
                action =  'Telescope command_history',
                key = 'h',
                key_hl = 'Number',
            },
            {
                icon = '  ',
                desc = 'Find  File                              ',
                desc_hl = 'String',
                action = 'Telescope find_files find_command=rg,--hidden,--files',
                key = 'f',
                key_hl = 'Number',
            },
            {
                icon = '  ',
                desc ='File Explorer                            ',
                desc_hl = 'String',
                action =  'NvimTreeToggle',
                key = 'e',
                key_hl = 'Number',
            },
            {
                icon = '  ',
                desc = 'Find  word                              ',
                desc_hl = 'String',
                action = 'Telescope live_grep',
                key = 'w',
                key_hl = 'Number',
            }
    },
    footer = {"Version: "..vim.api.nvim_get_var('doomnvim_version')}  --your footer
  }
})
E
