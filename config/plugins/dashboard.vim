"===========================================================
" dashboard configuration
" Author: Pierre-Yves Douault
" License: MIT
"===========================================================

lua <<EOF
local home = os.getenv('HOME')
local db = require('dashboard')
local ver = vim.api.nvim_get_var('doomnvim_version')
db.custom_header  = {
    \ "=================     ===============     ===============   ========  ========",
    \ "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
    \ "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
    \ "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
    \ "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
    \ "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
    \ "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
    \ "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
    \ "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
    \ "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
    \ "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
    \ "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
    \ "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
    \ "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
    \ "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
    \ "||.=='    _-'                                                     `' |  /==.||",
    \ "=='    _-'                 _   _ _   _ ________  ___                  \\/   `==",
    \ "\\   _-'                   | \\ | | | | |_   _|  \\/  |                   `-_   /",
    \ " `''                      |  \\| | | | | | | | .  . |                      ``' ",
    \ "                          | . ` | | | | | | | |\\/| |                          ",   
    \ "                          | |\\  \\ \\_/ /_| |_| |  | |                          ",  
    \ "                          \\_| \\_/\\___/ \\___/\\_|  |_/                          ",
\ }
db.custom_footer = {"Version: "..vim.api.nvim_get_var('doomnvim_version')}
db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC q l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC s f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f e'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC s w'}
    }
EOF
