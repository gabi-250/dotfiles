-- Highlight trailing whitespace
vim.fn.matchadd('errorMsg', [[\s\+$]])

-- Removes trailing spaces 
function trim_whitespace()
  vim.api.nvim_exec([[
      %s/\s\+$//e
  ]], false)
end

vim.api.nvim_exec([[
  augroup whitespace
      autocmd FileWritePre    * :lua trim_whitespace()
      autocmd FileAppendPre   * :lua trim_whitespace()
      autocmd FilterWritePre  * :lua trim_whitespace()
      autocmd BufWritePre     * :lua trim_whitespace()
  augroup END
]], false)
