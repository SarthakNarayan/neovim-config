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
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  use "lunarvim/colorschemes"
  use "ellisonleao/gruvbox.nvim"

   -- completion plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  -- completions
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions

  -- luasnip engine, compulsory in the setup of cmp.lua file
  use "L3MON4D3/LuaSnip" -- snippet engine required for completion
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "ray-x/lsp_signature.nvim" -- function signatures
  use "jose-elias-alvarez/null-ls.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", -- running TSUpdate everytime this plugins is loaded
  }
  use "p00f/nvim-ts-rainbow" -- rainbow highlighter for parenthesis, configuration is in treesitter

  -- Autopairs plugin for automatically inserting surrounding brackets and qoutes
  use "windwp/nvim-autopairs"

  -- Easy comments, default key bindings are good and are commented out in keymaps for reference
  use "numToStr/Comment.nvim"

  -- Git signs
  use "lewis6991/gitsigns.nvim"

  -- nvim tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }
 
  -- using bufferline
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use "moll/vim-bbye" -- complements bufferline for closing plugins

  -- lualine status line at the bottom
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- toggle term
  use "akinsho/toggleterm.nvim"

  -- vim notify
  use "rcarriga/nvim-notify"

  -- impatient
  use 'lewis6991/impatient.nvim'

  -- indent line
  use "lukas-reineke/indent-blankline.nvim"

  -- alpha startup
  use "goolord/alpha-nvim"

  -- neoclip, clipboard manager
  use "AckslD/nvim-neoclip.lua"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
