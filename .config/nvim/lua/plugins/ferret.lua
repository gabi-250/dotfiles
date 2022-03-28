vim.api.nvim_set_keymap('n', 'mm', ':silent Ack!<Space>', { silent = true })
vim.api.nvim_set_keymap('n', '[q', ':cprevious<CR>', { silent = true })
vim.api.nvim_set_keymap('n', ']q', ':cnext<CR>', { silent = true })

if vim.fn.executable('rg') then
    vim.g.ackprg = 'rg --vimgrep --smart-case'
end
