if vim.fn.executable('rg') then
    vim.g.ackprg = 'rg --vimgrep --smart-case'
end
