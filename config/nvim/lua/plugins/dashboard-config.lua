local home = os.getenv('HOME')
local vim = vim
-- local g = vim.g
local dashboard = require("dashboard")

local dashboard_default_executive = "telescope"

vim.cmd("packadd dashboard-nvim")

-- local custom_header = {
--   "",
--   "",
--   "",
--   "            _/_",
--   "          -'a\\",
--   "            ||",
--   "            |J",
--   "            2_\\",
--   "           /:::\\",
--   "          |;ooo;|",
--   "          /Oo@ o\\",
--   "         '/o oOo\\`",
--   "         /@ O o @\\",
--   "        '/.o,()o,\\`",
--   "        /().O O  o\\",
--   "       / @ , @. () \\",
--   "      /,o O' o O o, \\",
--   "   _-'. 'o _o _O_o-o.`-_",
--   '   `"""---......---"""`',
--   "    K Y O T O    N V I M     ",
-- }

local nvim_header = {
        '                                                       ',
        '                                                       ',
        '                                                       ',
        ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
        ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
        ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
        ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
        ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
        ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        '                                                       ',
        '                                                       ',
        '                                                       ',
        '                                                       ',
}

-- g.dashboard_custom_header = custom_header
-- g.dashboard_custom_header = nvim_header

local dashboard_custom_section = {
  {
    icon = '  ',
    desc = "Find File                  ",
    shortcut = 'SPC f f',
    action = "Telescope find_files",
  },
  {
    icon = '  ',
    desc = "Recents                    ",
    shortcut = 'SPC f o',
    action = "Telescope oldfiles",
  },
  {
    icon = '洛 ',
    desc = "New Buffer                 ",
    shortcut = 'SPC g g',
    action = "enew",
  },
  {
    icon = '  ',
    desc = "Edit Configuration         ",
    shortcut = 'SPC d c',
    action = "e ~/.config/nvim/lua/kyotorc.lua",
  },
}

local dashboard_custom_footer = { "KYOTO.NVIM" }

-- dashboard.custom_header = nvim_header
-- dashboard.custom_center = dashboard_custom_section
-- dashboard.custom_footer = dashboard_custom_footer
dashboard.setup {
  theme = 'doom',
  config = {
    header = nvim_header,
    center = dashboard_custom_section,
    footer = dashboard_custom_footer
  }
}
