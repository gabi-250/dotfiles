vim.g.bufferline_echo = 0
vim.g.bufferline_rotate = 2
vim.g.bufferline_fname_mod = ':.'

vim.api.nvim_set_keymap('n', '<C-PageUp> ', ':bp!<CR>', {})
vim.api.nvim_set_keymap('i', '<C-PageUp> ', '<C-o>:bp!<CR>', {})

vim.api.nvim_set_keymap('n', '<C-PageDown> ', ':bn!<CR>', {})
vim.api.nvim_set_keymap('i', '<C-PageDown> ', '<C-o>:bn!<CR>', {})
