-- TODO: rewrite this in lua
vim.api.nvim_exec([[
" Highlight word ---------------------- {{{
" Highlight Word, initial version from:
"   https://gist.github.com/emilyst/9243544#file-vimrc-L142
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" \0 unsets all highlighting
function! HiInterestingWord(n)
    hi def HiInterestingWord1 guifg=#000000 ctermfg=16  guibg=#ffa724 ctermbg=214
    hi def HiInterestingWord2 guifg=#000000 ctermfg=16  guibg=#aeee00 ctermbg=154
    hi def HiInterestingWord3 guifg=#000000 ctermfg=16  guibg=#8cffba ctermbg=121
    hi def HiInterestingWord4 guifg=#000000 ctermfg=16  guibg=#b88853 ctermbg=137
    hi def HiInterestingWord5 guifg=#000000 ctermfg=16  guibg=#ff9eb8 ctermbg=211
    hi def HiInterestingWord6 guifg=#000000 ctermfg=16  guibg=#ff2c4b ctermbg=195
    hi def HiInterestingWord7 guifg=#000000 ctermfg=16  guibg=#ffffff ctermbg=231
    hi def HiInterestingWord8 guifg=#ffffff ctermfg=231 guibg=#000000 ctermbg=16

    " HiInterestingWord(0) clears all the matches, including the general
    " search highlighting.
    if a:n == 0
        let i = 1
        while i <= 6
            let mid = 86750 + i
            silent! call matchdelete(mid)
            let i += 1
        endwhile
        set hlsearch!
        return
    endif

    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd('HiInterestingWord' . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction


" Default Highlights
nmap <silent> <leader>0 :call HiInterestingWord(0)<cr>
nmap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nmap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nmap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nmap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nmap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nmap <silent> <leader>6 :call HiInterestingWord(6)<cr>
nmap <silent> <leader>7 :call HiInterestingWord(7)<cr>
nmap <silent> <leader>8 :call HiInterestingWord(8)<cr>
]], false)
