" Reference: http://www.rayninfo.co.uk/vimtips.html

"configuration file ".vimrc" goes [if you don't see it, it's because it' shidden ==> CTRL + H]:
"/home/cardoppler/.vimrc

":scriptnames shows the loaded modules

"If you want to check if "background" has been correctly set by your loaded .vimrc file
":verbose set background






set nocompatible " get rid of Vi compatibility mode. SET FIRST!
syntax enable
set laststatus=2    " last window always has a statusline
set ruler       " Always show info along bottom.
syn on
set ttyfast
set mouse=a     " Enable mouse in all modes
set ttymouse=xterm2

set t_Co=256              " enable 256-color mode.

set number " show line numbers


" Show the current mode
set showmode

" Show the filename in the window titlebar
set title
 
set showcmd " display incomplete commands


set clipboard=unnamed   " Use the OS clipboard by default (on versions compiled with `+clipboard`)

" Enhance command-line completion
set wildmenu


" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast



" Don’t add empty newlines at the end of files
set binary
set noeol




" Don’t reset cursor to start of line when moving around.
set nostartofline


" Spaces, indent, tabs
" Needed for Syntax Highlighting and stuff
filetype plugin indent on " load file type plugins + indentation
filetype indent on        " activates indenting for files
set nowrap " don't wrap lines
set expandtab " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode
set autoindent smartindent
set expandtab "Spaces instead of tabs
set smarttab " use tabs at the start of a line, spaces elsewhere
set shiftwidth=4 "Size of the tab in chars
set tabstop=4             " tab spacing
set softtabstop=4
set shiftround            " always indent/outdent to the nearest tabstop
set diffopt=vertical " Start diff mode with vertical splits



" searching
set nohlsearch            " Don't continue to highlight searched phrases.
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



set encoding=utf-8
set grepprg=grep\ -nH\ $*

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list


set scrolloff=5 " Start scrolling 5 lines before the horizontal window border
set sidescrolloff=5 " keep at least 5 lines left/right

set noerrorbells " No error bells please
set wildmenu " menu has tab completion

set cul " highlight current line
hi CursorLine term=none cterm=none ctermbg=0* " adjust color




" Centralize backups, swapfiles and undo history
" You need to manually create the folders 
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif












" ESC+ESC saves and quits vim. Danger zone
"map <Esc><Esc> :wq<CR>

" NerdTree
"execute pathogen#infect()
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"autocmd vimenter * if !argc() | NERDTree | endif
"map <C-e> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
