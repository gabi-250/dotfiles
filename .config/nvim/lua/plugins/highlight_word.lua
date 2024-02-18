function hi_interesting_word_init()
    vim.api.nvim_set_hl(0, 'InterestingWord1', { fg = '#000000', ctermfg = 16, bg = '#ffa724', ctermbg = 214 })
    vim.api.nvim_set_hl(0, 'InterestingWord2', { fg = '#000000', ctermfg = 16, bg = '#aeee00', ctermbg = 154 })
    vim.api.nvim_set_hl(0, 'InterestingWord3', { fg = '#000000', ctermfg = 16, bg = '#8cffba', ctermbg = 121 })
    vim.api.nvim_set_hl(0, 'InterestingWord4', { fg = '#000000', ctermfg = 16, bg = '#b88853', ctermbg = 137 })
    vim.api.nvim_set_hl(0, 'InterestingWord5', { fg = '#000000', ctermfg = 16, bg = '#ff9eb8', ctermbg = 211 })
    vim.api.nvim_set_hl(0, 'InterestingWord6', { fg = '#000000', ctermfg = 16, bg = '#ff2c4b', ctermbg = 195 })
    vim.api.nvim_set_hl(0, 'InterestingWord7', { fg = '#000000', ctermfg = 16, bg = '#ffffff', ctermbg = 231 })
    vim.api.nvim_set_hl(0, 'InterestingWord8', { fg = '#ffffff', ctermfg = 231, bg = '#000000', ctermbg = 16 })
end

-- Highlight Word, initial Vimscript version from:
--   https://gist.github.com/emilyst/9243544#file-vimrc-L142
--
-- This mini-plugin provides a few mappings for highlighting words temporarily.
--
-- \0 unsets all highlighting
function hi_interesting_word(n)
    -- XXX This doesn't really belong here (it should only be called once)
    hi_interesting_word_init()
    local match_id_base = 86750
    -- hi_interesting_word(0) clears all the matches, including the general
    -- search highlighting.
    if n == 0 then
        i = 1
        while i <= 8 do
            local mid = match_id_base + i
            pcall(vim.fn.matchdelete, mid)
            i = i + 1
        end
        vim.api.nvim_exec('set hlsearch!', false)
        return
    end

    -- Save our location.
    vim.api.nvim_feedkeys('mz', 'x', true)

    -- Yank the current word into the z register.
    vim.api.nvim_feedkeys([["zyiw]], 'x', true)

    -- Calculate an arbitrary match ID. Hopefully nothing else is using it.
    local mid = match_id_base + n

    -- Clear existing matches, but don't worry if they don't exist.
    pcall(vim.fn.matchdelete, mid)

    -- Construct a literal pattern that has to match at boundaries.
    local pat = [[\V\<]] .. vim.fn.escape(vim.fn.getreg('z'), [[\]]) .. [[\>]]

    -- Actually match the words.
    vim.fn.matchadd('InterestingWord' .. n, pat, 1, mid)

    -- Move back to our original location.
    vim.api.nvim_feedkeys('`z', 'x', true)
end

vim.api.nvim_set_keymap('n', '<Leader>0', [[<cmd>lua hi_interesting_word(0)<CR>]], {})
vim.api.nvim_set_keymap('n', '<Leader>1', [[<cmd>lua hi_interesting_word(1)<CR>]], {})
vim.api.nvim_set_keymap('n', '<Leader>2', [[<cmd>lua hi_interesting_word(2)<CR>]], {})
vim.api.nvim_set_keymap('n', '<Leader>3', [[<cmd>lua hi_interesting_word(3)<CR>]], {})
vim.api.nvim_set_keymap('n', '<Leader>4', [[<cmd>lua hi_interesting_word(4)<CR>]], {})
vim.api.nvim_set_keymap('n', '<Leader>5', [[<cmd>lua hi_interesting_word(5)<CR>]], {})
vim.api.nvim_set_keymap('n', '<Leader>6', [[<cmd>lua hi_interesting_word(6)<CR>]], {})
vim.api.nvim_set_keymap('n', '<Leader>7', [[<cmd>lua hi_interesting_word(7)<CR>]], {})
vim.api.nvim_set_keymap('n', '<Leader>8', [[<cmd>lua hi_interesting_word(8)<CR>]], {})
