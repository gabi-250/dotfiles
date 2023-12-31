local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup{
  pickers = {
    live_grep = {
      theme = "ivy",
    },
    grep_string = {
      theme = "ivy",
    },
    diagnostics = {
      theme = "ivy",
    },
  },
}

vim.api.nvim_set_keymap('n', 'mm', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', 'mn', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', 'md', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], { noremap = true })
