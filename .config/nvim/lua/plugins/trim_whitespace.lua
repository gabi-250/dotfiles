-- Highlight trailing whitespace
vim.fn.matchadd('errorMsg', [[\s\+$]])

-- Decides whether to allow space trimming
function toggle_trim_whitespace()
  vim.b.do_not_trim_whitespace = not vim.b.do_not_trim_whitespace
end

-- Removes trailing spaces
function trim_whitespace()
  if not vim.b.do_not_trim_whitespace then
    vim.api.nvim_exec([[
        %s/\s\+$//e
    ]], false)
  end
end

vim.api.nvim_exec([[
  augroup whitespace
      autocmd FileWritePre    * :lua trim_whitespace()
      autocmd FileAppendPre   * :lua trim_whitespace()
      autocmd FilterWritePre  * :lua trim_whitespace()
      autocmd BufWritePre     * :lua trim_whitespace()
  augroup END
]], false)

vim.api.nvim_set_keymap('n', '<F7>', '<cmd>lua toggle_trim_whitespace()<CR>', { silent = true })
vim.api.nvim_set_keymap('i', '<F7>', '<cmd>lua toggle_trim_whitespace()<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<F7>', '<cmd>lua toggle_trim_whitespace()<CR>', { silent = true })
