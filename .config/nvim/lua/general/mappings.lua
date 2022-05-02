-- .vimrc quick open
vim.api.nvim_set_keymap('n', '<Leader>ev', ':split $MYVIMRC<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sov', ':source $MYVIMRC<CR>', { noremap = true })
-- Preserve the yank post-selection
vim.api.nvim_set_keymap('x', 'p', 'pgvy', { noremap = true })
