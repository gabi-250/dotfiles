local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local use = require('packer').use
return require('packer').startup(function(use)
  -- Cosmetic
  use '/morhetz/gruvbox'
  use 'bling/vim-airline'
  use 'edkolev/tmuxline.vim'
  -- Improve the `.` repeat command.
  use 'tpope/vim-repeat'
  -- Fuzzy file name matcher
  use 'kien/ctrlp.vim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Syntax highlighting
  --use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  use 'saltstack/salt-vim'
  use 'leafgarland/typescript-vim'
  use 'cespare/vim-toml'
  -- Easier commenting/uncommenting
  use 'scrooloose/nerdcommenter'
  -- Easier jumping
  use {
    'phaazon/hop.nvim',
    branch = 'v1',
  }
  -- Indicate which lines were added/modified/removed according to VCS.
  use 'mhinz/vim-signify'
  -- File search
  use 'wincent/ferret'
  -- Automatically adjust 'shiftwidth' and 'expandtab'
  use 'tpope/vim-sleuth'
  -- Automatically insert structure/statement end (inserts endifs and so on).
  use 'tpope/vim-endwise'
  use 'tpope/vim-sensible'
  -- LSP client configuration
  use 'neovim/nvim-lspconfig'
  -- Completion engine
  use 'hrsh7th/nvim-cmp'
  -- Snippets
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- Path completion
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
