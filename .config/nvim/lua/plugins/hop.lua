local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup()

vim.api.nvim_set_keymap("n", ";", "<cmd>HopWord<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", ";", "<cmd>HopWord<CR>", { noremap = true })
