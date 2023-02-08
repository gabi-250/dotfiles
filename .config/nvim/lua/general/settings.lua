-- Basic settings
vim.o.number = true
vim.o.showmatch = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest'
vim.o.hidden = true
vim.o.encoding = 'utf-8'
vim.o.spelllang = 'en_us'
vim.o.clipboard = 'unnamedplus'
vim.o.backspace = 'indent,eol,start'
vim.o.tw = 80
vim.o.fo = 'cq'
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.display = 'lastline'
vim.o.lazyredraw = true
-- Save undos after file closes
vim.o.undofile = true
-- where to save undo histories
vim.o.undodir = vim.fn.stdpath('config') .. '/undo'
-- How many undos
vim.o.undolevels = 10000
-- number of lines to save for undo
vim.o.undoreload = 100000
-- Always show the sign column
vim.o.signcolumn = 'yes'

if vim.fn.executable('rg') then
    vim.o.grepprg = 'rg --color=never'
end

-- Highlight yanked text
vim.cmd([[
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout=1000})
augroup END
]])
