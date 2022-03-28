vim.g.ctrlp_by_filename = false
vim.g.ctrlp_regexp = false
vim.g.ctrlp_match_window = 'order:ttb,min:10,max:100,results:100'
vim.g.ctrlp_max_files = false
vim.g.ctrlp_clear_cache_on_exit = false

if vim.fn.executable('fd') then
    vim.g.ctrlp_user_command = 'fd --type f --color=never "" %s'
end

if vim.fn.executable('rg') then
    vim.o.grepprg = 'rg --color=never'
    vim.g.ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    vim.g.ctrlp_use_caching = 0
end

vim.api.nvim_set_keymap('n', '<C-b>', ':CtrlPBuffer<CR>', {})
vim.api.nvim_set_keymap('i', '<C-b>', '<C-o>:CtrlPBuffer<CR>', {})

vim.api.nvim_set_keymap('n', '<C-p>', ':CtrlPMixed<CR>', {})
vim.api.nvim_set_keymap('i', '<C-p>', '<C-o>:CtrlPMixed<CR>', {})
