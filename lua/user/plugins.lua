local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
  use "numToStr/Comment.nvim"  -- Easy commenting

  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  })

  use "akinsho/toggleterm.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "lewis6991/impatient.nvim" -- Improves loading speeds through caching

  -- Colorschemes
  use "lunarvim/colorschemes" -- Colorscheme package
  use "luisiacc/gruvbox-baby"
  use "morhetz/gruvbox"

  -- completion plugins
  use "hrsh7th/nvim-cmp"                             -- The completion plugin
  use { 'hrsh7th/cmp-nvim-lsp', require = 'nvim-cmp' } -- lsp completion
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }   -- buffer auto-completion
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }     -- path auto-completion
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }  -- cmdline auto-completio
  use { "hrsh7th/cmp-nvim-lua", after = 'nvim-cmp' }
  use "saadparwaiz1/cmp_luasnip"                     -- snippet completion
  use "windwp/nvim-autopairs"                        -- Autopairs, integrates with both cmp and treesitter

  -- Snippets
  use "L3MON4D3/LuaSnip"                -- snippet engine
  use "rafamadriz/friendly-snippets"    -- a bunch of snippets to use
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    }
  }

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- Telescope is the fuzzy finder
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Buffer and status line
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  use "jamestthompson3/nvim-remote-containers"

  -- Dashboard
  use {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require 'alpha.themes.dashboard'.config)
    end
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
