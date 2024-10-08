local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

require("packer").startup(function(use)
  -- use("onsails/lspkind-nvim")

  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require'nvim-tree'.setup({})
    end,
  })

  use("glepnir/lspsaga.nvim")
  -- use("kabouzeid/nvim-lspinstall") → Broken after new lsp-config installation
  -- use("williamboman/nvim-lsp-installer")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
  })

  use("neovim/nvim-lspconfig")
  use("folke/tokyonight.nvim")

  use({
    "hoob3rt/lualine.nvim",
    event = "BufWinEnter",
    config = function()
      require("plugins.statusline")
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("plugins.telescope-config")
    end,
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    tag = '0.1.4',
  })

  use({
    "akinsho/nvim-bufferline.lua",
    event = "BufWinEnter",
    config = function()
      require("plugins.top-bufferline")
    end,
    requires = "kyazdani42/nvim-web-devicons",
  })

  use("jiangmiao/auto-pairs")

  use({
    "folke/trouble.nvim",
    branch = "main",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
    requires = "kyazdani42/nvim-web-devicons",
  })

  -- use({
  --   "glepnir/dashboard-nvim",
  --   opt = true,
  --   cmd = {
  --     "Dashboard",
  --     "DashboardChangeColorscheme",
  --     "DashboardFindFile",
  --     "DashboardFindHistory",
  --     "DashboardFindWord",
  --     "DashboardJumpMarks",
  --     "DashboardNewfile",
  --   },
  -- })

  use({"glepnir/dashboard-nvim"})

  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("plugins.gitsigns-config")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use("simrat39/symbols-outline.nvim")
  use("folke/which-key.nvim")
  use("tpope/vim-commentary")
  use("kdheepak/lazygit.nvim")
  use("yuttie/comfortable-motion.vim")

  use({
    "folke/twilight.nvim",
    opt = true,
  })

  use("gelguy/wilder.nvim")
  use({ "maxmellon/vim-jsx-pretty", opt = true })

  use({
    "folke/zen-mode.nvim",
    opt = true,
  })

  use({ "tweekmonster/startuptime.vim", opt = true })

  use("ray-x/lsp_signature.nvim")

  -- Dracula Theme
  use({ "dracula/vim", as = "dracula" })

  -- Multicursors
  use({ 'terryma/vim-multiple-cursors' })

  -- Vim-rainbow
  -- use({'frazrepo/vim-rainbow'})

  -- Smart pasting
  use({ 'sickill/vim-pasta' })

  -- Packer can manage itself
  use({ "wbthomason/packer.nvim" })

  -- XML helper
  use({ 'othree/xml.vim' })

  -- Vim-JavaScript better highlighting and indenting
  -- use({ 'pangloss/vim-javascript' })

  -- Vim-Polyglot for better language-specific code processing → crashing on html with jquery
  use({ 'sheerun/vim-polyglot' })

  -- Vim-go
  -- use({ 'fatih/vim-go' })

  -- Coq completion
  use("ms-jpq/coq_nvim")
  use("ms-jpq/coq.artifacts")
  use("ms-jpq/coq.thirdparty")

  -- Vim-Notes
  use("xolox/vim-misc")
  use("xolox/vim-notes")

  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

  for _, plugin in ipairs(vim.g.kyoto_extra_plugins) do
    use(plugin)
  end
end)
