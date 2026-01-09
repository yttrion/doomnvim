local home = os.getenv('HOME')
local db = require('dashboard')
local ver = vim.api.nvim_get_var('doomnvim_version')
db.setup({
    theme = 'doom',
    config = {
        header = {
            "v"..vim.api.nvim_get_var('doomnvim_version'),
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
                key = 'xh',
                key_hl = 'Number',
            },
            {
                icon = '  ',
                desc = 'Find  File                              ',
                desc_hl = 'String',
                action = 'Telescope find_files',
                key = 'ff',
                key_hl = 'Number',
            },
            {
                icon = '  ',
                desc ='File Explorer                            ',
                desc_hl = 'String',
                action =  'NvimTreeToggle',
                key = 'fe',
                key_hl = 'Number',
            },
            {
                icon = '  ',
                desc = 'Show help tags                          ',
                desc_hl = 'String',
                action = 'Telescope help_tags',
                key = 'ht',
                key_hl = 'Number',
            },
            {
                icon = '  ',
                desc = 'Show keymaps                            ',
                desc_hl = 'String',
                action = 'Telescope keymaps',
                key = 'hk',
                key_hl = 'Number',
            }
    },
  }
})

