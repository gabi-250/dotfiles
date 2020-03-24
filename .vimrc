set nocompatible
set encoding=utf-8

" pasting from 'outside'
set clipboard=unnamedplus

let install_plugs=0
let vim_plug=expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug)
    echo "Installing vim-plug.."
    echo ""
    let autoload_dir=$HOME . "/.vim/autoload"
    if !isdirectory(autoload_dir)
        call mkdir(autoload_dir, "p", 0700)
    end
    if executable('wget') == 1
        silent !wget -O .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    elseif executable('curl') == 1
        silent !curl -o .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        let uname=system('uname')
        if uname =~ "OpenBSD"
            silent !ftp -o .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        else
            echo "Can't find any suitable program to download vim-plug. Aborting."
            echo ""
            exit 1
        endif
    endif
    let install_plugs=1
endif
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim' " Python auto-complete
Plug 'tpope/vim-fugitive' " Git extras
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic' " Multi-language syntax checker
Plug 'mhinz/vim-signify'
Plug 'sjl/gundo.vim' " Tree of undos
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'Shougo/neocomplcache.vim'
Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim' " Fuzzy filename matcher
Plug 'FelikZ/ctrlp-py-matcher' " Speeds up CtrlP
Plug 'ap/vim-css-color'
Plug 'bling/vim-bufferline'
Plug 'Lokaltog/vim-easymotion'
Plug 'rust-lang/rust.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-endwise'
Plug 'morhetz/gruvbox' " Nice colour scheme
Plug 'nvie/vim-flake8'
Plug 'edkolev/tmuxline.vim'
Plug 'tacahiroy/ctrlp-funky' " Search for functions in the current file
Plug 'scrooloose/nerdcommenter' " Comment / uncomment blocks
Plug 'vim-scripts/mako.vim' " Mako plugins
Plug 'craigemery/vim-autotag'
Plug 'wincent/ferret'


if executable('rustc') == 1
    Plug 'phildawes/racer' " Rust autocomplete
endif
call plug#end()

"...All your other bundles...
if install_plugs == 1
    echo "Installing plugins (ignore key map error messages)"
    echo ""
    :PlugInstall
endif


" line numbers:
set number

set mousehide		" Hide the mouse when typing text
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest
set guioptions-=T
set hidden

set backspace=indent,eol,start
set tw=80
set fo=cq
set tabstop=4
set expandtab
inoremap <S-Tab> <C-V><Tab>
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set display+=lastline
set nojoinspaces
set lazyredraw

let output=system('xvidtune -show | grep "[0-9]*x[0-9]" | cut -d " " -f 1')
"if output =~ ".2560x1440.*"
"    set guifont=Liberation\ Mono\ for\ Powerline\ 10
"else
"    set guifont=Liberation\ Mono\ for\ Powerline\ 13
"endif

set guifont=Monospace\ 13

" Basic editing sanity

noremap <BS> <Left>X
inoremap <S-BS> <C-o>db
noremap <S-BS> db
inoremap <S-Del> <C-o>dw
noremap <S-Del> dw


" Spelling

set spelllang=en_us


" Misc

match ErrorMsg '\s\+$'

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()


let output=system("find ~/.vim/spell/en.utf-8.add -cnewer ~/.vim/spell/en.utf-8.add.spl | wc -l")
if str2nr(output) == 1
    mkspell! ~/.vim/spell/en.utf-8.add
endif
let g:tex_flavor='latex'
if has("autocmd")
    autocmd FileType mail set spell |
      \ set textwidth=76 |
      \ let &colorcolumn=join(range(81,9999), ',')

    autocmd FileType html,python,rust,tex set spell

    autocmd FileType html,tex autocmd BufEnter * :syntax sync fromstart

    autocmd FileType sh set tabstop=4 shiftwidth=4 softtabstop=4

    autocmd FileType gitcommit set spell |
      \ set textwidth=80 |
      \ let &colorcolumn=join(range(81,9999), ',')

    autocmd BufNewFile,BufRead * NeoComplCacheLock
endif

let g:gruvbox_contrast_light = 'hard'

" Airline

set laststatus=2
let g:airline_theme                         = 'gruvbox'
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#syntastic#enabled  = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep                      = '▶'
let g:airline_right_sep                     = '◀'
let g:airline_symbols.branch                = '⎇'
let g:airline_symbols.paste                 = '∥'
let g:airline_symbols.linenr                = '¶'
let g:airline_symbols.whitespace            = 'Ξ'
let g:airline#extensions#tabline#enabled    = 1
let g:airline#extensions#bufferline#enabled = 0


" Bufferline

let g:bufferline_echo = 0
let g:bufferline_rotate = 2
let g:bufferline_fname_mod = ':.'
nmap <C-PageUp> :bp!<CR>
imap <C-PageUp> <C-o>:bp!<CR>
nmap <C-PageDown> :bn!<CR>
imap <C-PageDown> <C-o>:bn!<CR>


" Ctrl-P

let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 0
let g:ctrlp_match_window = 'order:ttb,min:10,max:100,results:100'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '\.(class|o|rlib|swp|pyc)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'


let g:ctrlp_user_command = []

" Use ripgrep
if executable('rg')
  let g:ctrlp_user_command = ['rg %s --files --color=never --glob ""']
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_user_command += ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_user_command += ['.hg', 'hg --cwd %s locate -I .']
nmap <C-b> :CtrlPBuffer<CR>
imap <C-b> <C-o>:CtrlPBuffer<CR>
nmap <C-p> :CtrlPMixed<CR>
imap <C-p> <C-o>:CtrlPMixed<CR>


" Ignore temporary directories and swap files
"
set wildignore+=*/.git/*,*/tmp/*,*.swp


" Funky

nnoremap <C-f> :CtrlPFunky<Cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1


" Yankstack

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste


" Jedi

let g:jedi#auto_initialization = 0
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_command = "gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"


" gruvbox

syntax enable
set background=light
function! Togglebg()
    if &background == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
colorscheme gruvbox
map <silent> <F6> :call Togglebg()<CR>
imap <silent> <F6> <ESC>:call Togglebg()<CR>a
vmap <silent> <F6> <ESC>:call Togglebg()<CR>gv


" Sy

let g:signify_vcs_list = ['hg', 'git']


" Supertab

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextTextOmniPrecedence=['&omnifunc', '&completefunc']


" Syntastic

" let g:syntastic_disabled_filetypes=['tex']


" neocomplcache

let g:neocomplcache_enable_at_startup = 1


" EasyMotion

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap h <Plug>(easymotion-bd-w)
omap h <Plug>(easymotion-bd-w)
vmap h <Plug>(easymotion-bd-w)
nmap * <Plug>(easymotion-sn)\<<C-R>=expand('<cword>')<CR>\><CR><CR>n


" ripgrep
if executable('rg')
  let grepprg = 'rg --vimgrep'
endif


" tmuxline
let g:tmuxline_preset = {
    \'c'       : '#(whoami)@#h',
    \'win'     : '#T',
    \'cwin'    : '#T',
    \'y'       : '%Y-%m-%d %l:%M%p',
    \'z'       : '#W',
    \'options' : {'status-justify': 'left'}}


" Email formatting
command -range=% -nargs=* EmailFormat <line1>,<line2>!email_format

fun EmailFormatBuffer()
    let Pos = line2byte( line( "." ) )
    :EmailFormat
    exe "goto " . Pos
endfun

fun InsertFile(f)
    let p = '~/.vim/' . a:f
    :exe "read " . p
endfunction

nnoremap <F2> :call EmailFormatBuffer()<CR>
vnoremap <F2> :Email_format<CR>
nnoremap <F3> :call InsertFile('sig_normal')<CR>
nnoremap <S-F3> :call InsertFile('sig_kings')<CR>
inoremap <F3> <Esc>:call InsertFile('sig_normal')<CR>
inoremap <S-F3> <Esc>:call InsertFile('sig_kings')<CR>
inoremap <f4> <Esc>O<Esc>:call InsertFile('reminder')<CR>
nnoremap <f4> O<Esc>:call InsertFile('reminder')<CR><Esc>ggJ$a<Left>


" Limit the text width for emails
au BufRead /tmp/mutt-* set tw=72


" Racer [auto-complete for Rust]
let racer_dir=$HOME . "/.vim/racer"
if executable('rustc')
    if !isdirectory(racer_dir)
        echo "Downloading and building racer and rust in the background."
        echo "This will take some time. Whilst this is ongoing, you may quit"
        echo "this VIM and start others without issue."
        silent !sh -c "git clone https://github.com/phildawes/racer $HOME/.vim/racer && cd $HOME/.vim/racer && cargo build --release" > /dev/null 2> /dev/null &
        silent !git clone https://github.com/rust-lang/rust $HOME/.vim/rust > /dev/null 2> /dev/null &
        let g:racer_cmd = ""
    else
        let g:racer_cmd = "$HOME/.vim/racer/target/release/racer"
    endif
    let rust_src_dir = $HOME . "/.vim/rust/src"
    let $RUST_SRC_PATH=rust_src_dir
endif


" Enable mouse in console mode
if has('mouse')
    set mouse+=a
    set mousemodel=popup_setpos
    set ttymouse=xterm2
endif


" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo


" Highlight Word, initial version from:
"   https://gist.github.com/emilyst/9243544#file-vimrc-L142
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.
"
" \0 unsets all highlighting

function! HiInterestingWord(n)
    hi def HiInterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
    hi def HiInterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
    hi def HiInterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
    hi def HiInterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
    hi def HiInterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
    hi def HiInterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

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


" Allow the font sizes to be quickly bumped up and down with Ctrl-↑ and Ctrl-↓

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

nnoremap <C-Up> :LargerFont<CR>
nnoremap <C-Down> :SmallerFont<CR>


" Don't shuffle the screen and cursor when switching between buffers
" From http://vim.wikia.com/wiki/Avoid_scrolling_when_switch_buffers

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction


" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

set noeb vb t_vb=


" linux kernel style
autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab


" run flake when saving
"
"autocmd BufWritePost *.py call Flake8()


" Ranger stuff
function! RangerChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangerChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>


" Update ctags on write
autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif

