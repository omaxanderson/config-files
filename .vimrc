set nocompatible

" Use Vundle to add plugins
set rtp+=~/.vim/bundle/Vundle.vim
" Allows for fuzzy search in vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype plugin indent on

" jump to last line edited in the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

syntax on

" Tab settings
set expandtab     " This hurts my soul but for the sake of consistency i'll use it
set tabstop=3
set shiftwidth=3

" Set the list options for whitespace
set list
set listchars=""
set listchars=tab:»\·
set listchars+=trail:·

" Set the actual line number and relative line numbers
set relativenumber
set number

" For case insensitive searching
" smartcase will add case sensitivity if you add capital letters to the regex
set ignorecase
set smartcase

" Wildmenu allows for some autocompletion in exec mode
set wildmenu
set wildmode=longest:list,full

" Add smart and autoindenting
set autoindent
set smartindent

"Allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

" Show the current cursor position on the bottom line
set ruler

" Incremental searching that shows partial matches
set incsearch

" Number of screen lines to keep above or below the cursor
set scrolloff=3

" Shows partial commands being used, for example when searching using f or F
" it will show the command you've been typing
set showcmd

let mapleader = ","
let localleader = "\\"

" Auto-commands that run when you change the filetype
autocmd FileType javascript nnoremap <buffer> <leader>c I// <esc>
autocmd FileType php nnoremap <buffer> <leader>c I// <esc>
autocmd FileType python nnoremap <buffer> <leader>c I# <esc>
autocmd FileType vim nnoremap <buffer> <leader>c I" <esc>
autocmd FileType sh nnoremap <buffer> <leader>c I# <esc>

" ==============  Normal Mode Mappings  ==============

" Leader-g to go-to, Leader-b to go back
nnoremap <leader>g viw:tag <c-r>"<CR>
nnoremap <leader>b <c-t>

" Quick shortcuts to edit and source my vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Space in normal mode selects entire word
nnoremap <space> viw 
nnoremap <c-u> viw~e

" Insert line above and below
nnoremap <leader>O O<esc>j
nnoremap <leader>o o<esc>k

" Move vertically by visual line
" Basically tells vim not to skip over long wrapped lines
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
nnoremap B ^ 
nnoremap E $ 

" Move line up or down
nnoremap - ddp 
nnoremap _ ddkP

" ==============  Insert Mode Mappings  ==============

" Bracket auto-match remaps 
inoremap (<CR> (<CR>)<Esc>ko
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko

" Cmd-u will toggle the current word's case
inoremap <c-u> <esc>viw~ea

" ==============  Visual Mode Mappings  ==============

set autoread
au FocusGained,BufEnter * :checktime
