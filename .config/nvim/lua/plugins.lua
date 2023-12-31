-- See https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Cosmetic
  use { '/morhetz/gruvbox', config = 'vim.cmd [[colorscheme gruvbox]]' }
  use { 'bling/vim-airline', after = 'gruvbox' }
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
  -- Marks
  use 'chentoast/marks.nvim'
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  -- editorconfig support
  use 'gpanders/editorconfig.nvim'

  -- Onion
  use {
    'https://gitlab.torproject.org/ahf/onion-vim',
    branch = 'main'
  }

  -- Clone packer.nvim if needed
  if packer_bootstrap then
    require('packer').sync()
  end
end)
