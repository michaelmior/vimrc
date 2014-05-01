set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'wesgibbs/vim-irblack'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'bling/vim-airline'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

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
set shortmess=atI               " Hide some unneeded messages
set colorcolumn=80              " Show a right margin

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

" Prettify JSON
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" NERDTree {
  autocmd vimenter * if !argc() | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
  let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
" }

set laststatus=2
set encoding=utf-8
let g:airline#extensions#disable_rtp_load = 1
let g:syntastic_objc_checker = ''
let g:syntastic_javascript_checker = 'jshint'
let g:syntastic_python_checker_args = '--ignore=E124,E126,E127,E128'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" Restore cursor position on load
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Stick in visual mode when indenting
vnoremap > >gv
vnoremap < <gv

" Avoid 'Press ENTER or type command to continue'
:cabbrev make make<CR>

" Disable one diff window during a three-way diff allowing you to cut out the
" noise of a three-way diff and focus on just the changes between two versions
" at a time. Inspired by Steve Losh's Splice
function! DiffToggle(window)
  " Save the cursor position and turn on diff for all windows
  let l:save_cursor = getpos('.')
  windo :diffthis
  " Turn off diff for the specified window (but keep scrollbind) and move
  " the cursor to the left-most diff window
  exe a:window . "wincmd w"
  diffoff
  set scrollbind
  set cursorbind
  exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
  " Update the diff and restore the cursor position
  diffupdate
  call setpos('.', l:save_cursor)
endfunction
" Toggle diff view on the left, center, or right windows
nmap <silent> <leader>dl :call DiffToggle(1)<cr>
nmap <silent> <leader>dc :call DiffToggle(2)<cr>
nmap <silent> <leader>dr :call DiffToggle(3)<cr>

:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>
noremap <silent> <CR> mao<Esc>`a

:command Wq wq
:command W w

" Indent XML
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
