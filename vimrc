" Load list of plugins
source ~/.vim/plugins.vim

filetype plugin indent on
syntax on

set undodir=~/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000

colorscheme hybrid
highlight ColorColumn ctermbg=red

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

" Change leader
let mapleader=","

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
map <Bslash> :nohls<cr>

" Show trailing whitespace and tabs when not using insert mode
set list
set listchars=tab:>·,trail:·
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

" Fix paste to match indentation levels
nnoremap p p`[v`]=

" Prettify JSON
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

set laststatus=2
set encoding=utf-8
let g:airline#extensions#disable_rtp_load = 1
let g:syntastic_objc_checker = ''
let g:syntastic_javascript_checker = 'jshint'
let g:syntastic_python_checker_args = '--ignore=E124,E126,E127,E128'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_always_populate_loc_list = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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

:command! Wq wq
:command! W w

" Indent XML
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Emmet shortcuts
let g:user_emmet_expandabbr_key='<C-E>'
let g:user_emmet_next_key='<C-K>'
let g:user_emmet_prev_key='<C-J>'

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" C-c to close buffer but keep window
nnoremap <C-c> :bp\|bd #<CR>

nmap <F8> :TagbarToggle<CR>
:vmap <C-C> "+y

" Spell checking
autocmd BufRead,BufNewFile *.md,*.tex setlocal spell

" Don't automatically fold markdown
let g:vim_markdown_folding_disabled=1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

au BufRead,BufNewFile *.plt,*.gnuplot set ft=gnuplot
au BufRead,BufNewFile .simplecov set ft=ruby

" Disable folding in vim-latex
:let Tex_FoldedSections=""
:let Tex_FoldedEnvironments=""
:let Tex_FoldedMisc=""

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Allow swapping adjacent words
nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohls<CR>
nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohls<CR>

" Disable ex mode
nnoremap Q <nop>

" Faster syntax checking with JRuby
let $JRUBY_OPTS = '--dev'

" Shortcut for writing file with sudo
cmap w!! w !sudo tee % >/dev/null

" Google Calendar
let g:calendar_google_calendar = 1
