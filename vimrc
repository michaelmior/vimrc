call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

set undodir=~/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000

colorscheme ir_black

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set title                       " Update window title on file change
set scrolloff=3                 " Keep three lines of buffer when scrolling
set sidescrolloff=3
set nocompatible                " Ensure we're not running in vi mode
set incsearch                   " Incremental search
set hlsearch                    " Highlight search results
set smartcase                   " Search is case-sensitive only if search contains upper case
set number                      " Show line numbers
set showcmd                     " Display commands in the statusline
set ruler                       " Show current line number in statusline
set backspace=indent,eol,start  " Allow backspacing over newlines and indentation
set ttyfast                     " It's ok vim, our terminal is fast
set tags=tags;/                 " Keep going up directories until tags is found
set wildmenu                    " Turn on wild menu :e <Tab>
set wildmode=list:longest       " Set wildmenu to list choice
set lazyredraw                  " Don't redraw while in macros
set hidden                      " Allow hiding of hidden buffers
set cursorline                  " Highlight the current line
set mouse+=a                    " Make the mouse behave more appropriately

" Disable error bells
set noerrorbells
set visualbell t_vb=

" Make cursor movements work as expected for wrapped lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" Use semicolon for command mode and comma for semicolon
nore ; :
nore , ;

" Quickly switch between buffers and tabs
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>
map <right> <ESC>:bn<RETURN>
map <left> <ESC>:bp<RETURN>
map <up> <ESC>:tabn<RETURN>
map <down> <ESC>:tabp<RETURN>

" Disable search highlighting
map - :nohls<cr>

" Show trailing whitespace and tabs when not using insert mode
set list
set listchars=tab:>·,trail:·
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

" Fix paste to match indentation levels
nnoremap p p`[v`]=
