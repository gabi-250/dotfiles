vim.cmd [[colorscheme gruvbox]]

vim.o.background = 'light'
vim.o.termguicolors = true

vim.g.gruvbox_contrast_light = 'medium'

function toggle_background()
    if vim.o.background == 'dark' then
        vim.o.background = 'light'
    else
        vim.o.background = 'dark'
    end
    -- Make sure the highlight groups are preserved after changing the
    -- color scheme.
    hi_interesting_word_init()
end

vim.api.nvim_set_keymap('n', '<F6>', '<cmd>lua toggle_background()<CR>', { silent = true })
vim.api.nvim_set_keymap('i', '<F6>', '<cmd>lua toggle_background()<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<F6>', '<cmd>lua toggle_background()<CR>', { silent = true })
