set encoding=utf-8
set nocompatible              " be iMproved, required
set wildignorecase
filetype off                  " required

" Intialize vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/Improved-AnsiEsc', { 'on': 'AnsiEsc' }
Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/Gist.vim', { 'on': 'Gist' }
Plug 'sk1418/HowMuch'
Plug 'vim-scripts/incsearch.vim'
Plug 'Yggdroot/indentLine'
Plug 'tmhedberg/matchit'
Plug 'valloric/MatchTagAlways', { 'for': ['html', 'xml'] }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'justincampbell/vim-eighties'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'w0ng/vim-hybrid'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'jez/vim-superman', { 'on': 'SuperMan' }
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'rbonvall/vim-textobj-latex', { 'for': ['tex', 'plaintex'] }
Plug 'rhysd/vim-textobj-ruby', { 'for': 'ruby' }
Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-unimpaired'
Plug 'wesQ3/vim-windowswap'
Plug 'mattn/webapi-vim'

" Add filetype plugins
Plug 'hura/vim-asymptote',                          { 'for': 'asy' }
Plug 'guns/vim-clojure-static',                     { 'for': 'clojure' }
Plug 'kchmck/vim-coffee-script',                    { 'for': 'coffee' }
Plug 'chrisbra/csv.vim',                            { 'for': 'csv' }
Plug 'ekalinin/Dockerfile.vim',                     { 'for': 'Dockerfile' }
Plug 'dag/vim-fish',                                { 'for':  'fish' }
Plug 'fatih/vim-go',                                { 'for': 'go' }
Plug 'vim-scripts/gnuplot.vim',                     { 'for': 'gnuplot' }
Plug 'othree/html5.vim',                            { 'for': 'html' }
Plug 'digitaltoad/vim-jade',                        { 'for': 'jade' }
Plug 'pangloss/vim-javascript',                     { 'for': 'javascript' }
Plug 'mxw/vim-jsx',                                 { 'for': 'javascript' }
Plug 'elzr/vim-json',                               { 'for': 'json' }
Plug 'groenewege/vim-less',                         { 'for': 'less' }
Plug 'tpope/vim-liquid',                            { 'for': 'liquid' }
Plug 'plasticboy/vim-markdown',                     { 'for': 'mkd' }
Plug 'nginx/nginx',                                 { 'for': 'nginx', 'rtp': 'contrib/vim/' }
Plug 'zah/nimrod.vim',                              { 'for': 'nim' }
Plug 'spf13/PIV',                                   { 'for': 'php' }
Plug 'wlangstroth/vim-racket',                      { 'for': 'racket' }
Plug 'vim-ruby/vim-ruby',                           { 'for': 'ruby' }
Plug 'wting/rust.vim',                              { 'for': 'rust' }
Plug 'cakebaker/scss-syntax.vim',                   { 'for': 'scss' }
Plug 'git://git.code.sf.net/p/vim-latex/vim-latex', { 'for': ['tex', 'plaintex'] }
Plug 'gittup/tup',                                  { 'for': 'tup', 'rtp': 'contrib' }

" tmux-specific plugins
if strlen($TMUX)
  Plug 'benmills/vimux'
  Plug 'edkolev/tmuxline.vim'
endif

call plug#end()
