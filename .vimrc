filetype plugin indent on

syntax on

set tabstop=3
set shiftwidth=3
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

" =============  Movement alterations ==============
"
" move vertically by visual line
" basically tells vim not to skip over long wrapped lines
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

set autoread
au FocusGained,BufEnter * :checktime