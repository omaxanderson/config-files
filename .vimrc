set nocompatible

" Plugin Management ----------------- {{{
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'flazz/vim-colorschemes'
Plugin 'felixhummel/setcolors.vim'

" Ripgrep for vim
Plugin 'jremmen/vim-ripgrep'

" Consider adding the syntax checker Ale

" Note: for these plugins to work on Unix I had to manually edit the files
"     that were throwing a bunch of errors by saving them with ':w ++ff=unix'
"     since they had a bunch of DOS newline characters
" Additional Note: The color scheme is ugly as hell, not using until i can
"     find a solution to that...
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'

" Plugin 'Valloric/YouCompleteMe'

call vundle#end()
" }}} 

" Get the current highlighting groups -------------{{{
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}

" Vimscript file settings ------------------ {{{
augroup filetype_vim
   autocmd!
   autocmd FileType vim setlocal foldmethod=marker
   autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}

" jump to last line edited in the file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on
syntax on

" Status line ------------ {{{
set statusline=%f                   " Filename
set statusline+=\ \ \|\ \           " Separator
set statusline+=FileType:\          " File
set statusline+=%y
set statusline+=\ \ \|\ \           " Separator
set statusline+=%l                  " Current Line
set statusline+=\ /\                " Separator
set statusline+=%L                  " Total lines
set statusline+=\ \ \|\ \           " Separator
set statusline+=%p%%
set laststatus=2                    " Show statusline on second to last line

" Show function name on status line
"     Does this actually work?
let g:ctags_statusline=1
" }}}

" Fold highlight group colors
highlight Folded ctermbg=Black ctermfg=Yellow

" Vimscript file settings -------------------- {{{
augroup filetype_vim
   autocmd!
   autocmd Filetype vim setlocal foldmethod=marker
" }}}

" Tab settings ------------- {{{
set expandtab     " This hurts my soul but for the sake of consistency i'll use it
set tabstop=3
set shiftwidth=3
" }}}

" Line numbers {{{
" Set the actual line number and relative line numbers
set relativenumber
set number
" }}}

" List options {{{
" Set the list options for whitespace
set list
set listchars=""
set listchars=tab:»\ 
set listchars+=trail:·
" }}} 

" Searching {{{
" For case insensitive searching smartcase will add case sensitivity if you add capital letters to the regex
set ignorecase
set smartcase

" Incremental searching that shows partial matches
set incsearch
" }}}

" Wildmenu {{{
" Wildmenu allows for some autocompletion in exec mode
set wildmenu
set wildmode=longest,full
" }}}

" Indentation {{{
" Add smart and autoindenting
set autoindent
set smartindent
" }}}

" Basic Settings -------------- {{{
"Allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

" Show the current cursor position on the bottom line
set ruler

" Number of screen lines to keep above or below the cursor
set scrolloff=3

" Shows partial commands being used, for example when searching using f or F
" it will show the command you've been typing
set showcmd

" }}}

let mapleader = ","
let localleader = "\\"

" Filetype autocommands {{{
autocmd FileType javascript nnoremap <buffer> <leader>c I// <esc>
autocmd FileType php nnoremap <buffer> <leader>c I// <esc>
autocmd FileType python nnoremap <buffer> <leader>c I# <esc>
autocmd FileType vim nnoremap <buffer> <leader>c I" <esc>
autocmd FileType sh nnoremap <buffer> <leader>c I# <esc>
" }}}

" Normal Mode Mappings {{{
" NERDTree Mapping
nnoremap <c-n> :NERDTreeToggle<CR>

" Ctags is required for this I believe
nnoremap <leader>g viwy:tabe<CR>:tjump <c-r>"<CR>
nnoremap <leader>b <c-t>

" Quick shortcuts to edit and source my vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>hi :call SynStack()<CR>

" Space in normal mode selects entire word
nnoremap <leader><space> viw
" nnoremap <c-u> viw~e

nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Move vertically by line
" Basically tells vim not to skip over long wrapped lines
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
nnoremap H ^
nnoremap L $

" Move line up or down
nnoremap - ddp
nnoremap _ ddkP
" }}}

" Insert Mode Mappings  {{{

" Uncomment this line to learn your new jk mapping for insert mode
" inoremap <esc> <nop>
inoremap jk <esc>

" Abbreviations (aka spellcheck)
iabbrev waht what
iabbrev taht that

" Bracket auto-match remaps 
inoremap (<CR> (<CR>)<Esc>ko
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko

" Cmd-u will toggle the current word's case
inoremap <c-u> <esc>viw~ea
" }}}

" Visual Mode Mappings {{{

" Surround selection with quotes
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>lel
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>lel

vnoremap <leader>cp :w !pbcopy<cr><cr>
" }}} 

" Operator/Movement Mappings {{{

" Inside next parentheses and inside last parentheses
onoremap in( :<c-u>normal! f(vi(<CR>
onoremap il( :<c-u>normal! F)vi(<CR>

" Function name on current line
onoremap F :<c-u>normal! 0f(hviw<CR>
" }}}

set autoread
au FocusGained,BufEnter * :checktime
