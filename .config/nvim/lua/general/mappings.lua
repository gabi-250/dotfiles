-- .vimrc quick open
vim.api.nvim_set_keymap('n', '<Leader>ev', ':split $MYVIMRC<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sov', ':source $MYVIMRC<CR>', { noremap = true })
