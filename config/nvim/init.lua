local vim = vim

-- line-numbers must be declared before dashboard
-- init because otherwise dashboard shows line numbers
vim.opt.nu = true
vim.opt.rnu = true

require("globals")

-- Dashboard configuration
require("plugins.dashboard-config")

-- Language server configuration
require("lsp-config")
-- general configurations
require("options")
-- configuration to help you remember keybindings
require("plugins.which-key-config")
-- extra plugins(with shorter configs)
require("plugins.misc")
-- require("plugins")
-- source our mappings last(may change)
vim.cmd("source ~/.config/nvim/viml/maps.vim")
-- auto-commands
vim.cmd("source ~/.config/nvim/viml/autocmd.vim")
-- source bindings.vim
-- vim.cmd("source ~/.config/nvim/viml/bindings.vim")
-- source init.vim
vim.cmd("source ~/.config/nvim/viml/init.vim")
-- user configurations
require("kyotorc")
