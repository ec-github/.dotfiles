" Reference: http://www.rayninfo.co.uk/vimtips.html

"configuration file ".vimrc" goes [if you don't see it, it's because it' shidden ==> CTRL + H]:
"/home/cardoppler/.vimrc

":scriptnames shows the loaded modules

"If you want to check if "background" has been correctly set by your loaded .vimrrc file
":verbose set background

syntax enable
set nocompatible " choose no compatibility with legacy vi
set laststatus=2
set ruler
syn on
set ttyfast
set mouse=a
set ttymouse=xterm2

set number " show line numbers

set showcmd " display incomplete commands

" Needed for Syntax Highlighting and stuff
filetype plugin indent on " load file type plugins + indentation

syntax enable
set encoding=utf-8
set grepprg=grep\ -nH\ $*

" Whitespace
set nowrap " don't wrap lines
set expandtab " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode
"set autoindent smartindent
set expandtab "Spaces instead of tabs
set smarttab
set shiftwidth=4 "Size of the tab in chars
set softtabstop=4

set diffopt=vertical " Start diff mode with vertical splits

" searching
set incsearch " incremental search
set ignorecase " search ignoring case
set smartcase " ... unless they contain at least one capital letter
set hlsearch " highlight the search
set showmatch " show matching bracket
set diffopt=filler,iwhite " ignore all whitespace and sync
set incsearch " jumps to search word as you type
" Center the line found during search
map N Nzz
map n nzz

set scrolloff=5 " keep at least 5 lines above/below
set sidescrolloff=5 " keep at least 5 lines left/right

set noerrorbells " No error bells please
set wildmenu " menu has tab completion

set cul " highlight current line
hi CursorLine term=none cterm=none ctermbg=0* " adjust color

map <Esc><Esc> :wq<CR>

" NerdTree
"execute pathogen#infect()
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"autocmd vimenter * if !argc() | NERDTree | endif
"map <C-e> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
