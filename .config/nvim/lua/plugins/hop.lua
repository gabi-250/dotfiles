require'hop'.setup()

vim.api.nvim_set_keymap("n", ";", "<cmd>HopWord<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", ";", "<cmd>HopWord<CR>", { noremap = true })
