if has('nvim')
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
endif

" Load list of plugins
runtime plugins.vim

if has('nvim')
  silent! call deoplete#enable()
  " deoplete tab-complete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  let g:deoplete#omni_patterns = {}
  let g:deoplete#omni_patterns.tex = '\\\(cite\|ref\){'
endif

let $COLORTERM = "gnome-terminal"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

filetype plugin indent on
syntax on

set undodir=~/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000

set background=dark
colorscheme hybrid
highlight Normal ctermbg=NONE
highlight ColorColumn ctermbg=red
highlight SignColumn ctermbg=NONE

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
autocmd BufNewFile,BufRead *.md set colorcolumn=

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
map <Bslash> :nohls<CR>:call clever_f#reset()<CR>

" Show trailing whitespace and tabs when not using insert mode
set list
set listchars=tab:>·,trail:·
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

" Prettify JSON
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

set laststatus=2
if !has('nvim')
  set encoding=utf-8
endif

let g:airline#extensions#disable_rtp_load = 1
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

if executable('rg')
  " Use ripgrep https://github.com/BurntSushi/ripgrep
  set grepprg=rg\ --color\ never\ --line-number\ --no-heading

  " Use rg in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --files --color never'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap <C-M-P> :CtrlPBuffer<CR>
nnoremap <C-F> :CtrlPFunky<CR>
let g:ctrlp_match_window = 'results:20'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

au BufRead,BufNewFile *.plt,*.gnuplot set ft=gnuplot
au BufRead,BufNewFile .simplecov set ft=ruby

" Disable folding in vim-latex
:let Tex_FoldedSections=""
:let Tex_FoldedEnvironments=""
:let Tex_FoldedMisc=""

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

" Add vim-signify highlighting to vim-signature
let g:SignatureMarkTextHLDynamic = 1

set pastetoggle=<F3>

" Use a darker colour to mark indentation
let g:indentLine_color_term = 239

" Make test commands execute using vimux
if strlen($TMUX)
  let test#strategy = "vimux"
  autocmd VimLeave * VimuxCloseRunner
endif

" Allow Control-Z to work in insert mode
nnoremap <C-Z> :suspend<CR>:SignifyRefresh<CR>
inoremap <C-Z> <C-O><C-Z>

" Open new split panes below and right
set splitbelow
set splitright

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" <bar> redraw!

" Add shortcuts for copy-paste to/from the clipboard
xnoremap <silent> gy "+y
xnoremap <silent> gp "+p
nnoremap <silent> gp "+p

" Move paragraphs by backspace/return
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {
nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

" Default to latex over plaintex
let g:tex_flavor = "latex"

" Hide . and .. in netrw
let g:netrw_list_hide = '^\.\.\?/$'
let g:netrw_hide = 1

" Set correct comment for Debian source lists
autocmd FileType debsources setlocal commentstring=#\ %s

" Fix thesaurus path
let g:tq_openoffice_en_file="/usr/share/mythes/th_en_US_v2"

" Set up forward search for mupdf
let g:vimtex_view_method='mupdf'
let g:vimtex_view_mupdf_send_keys='i'

augroup vimtex_config
  autocmd User VimtexEventInitPost silent VimtexCompile
augroup END
