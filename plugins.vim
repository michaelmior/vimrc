set encoding=utf-8
set nocompatible              " be iMproved, required
set wildignorecase
filetype off                  " required

" Intialize vim-plug
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
Plug 'michaeljsmith/vim-indent-object'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-endwise'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'majutsushi/tagbar'
Plug 'nginx/nginx', {'rtp': 'contrib/vim/'}
Plug 'hura/vim-asymptote', { 'for': 'asy' }
Plug 'vim-scripts/Improved-AnsiEsc', { 'on': 'AnsiEsc' }
Plug 'kien/ctrlp.vim'
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'w0ng/vim-hybrid'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'valloric/MatchTagAlways', { 'for': ['html', 'xml'] }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-scripts/gnuplot.vim', { 'for': 'gnuplot' }
Plug 'git://git.code.sf.net/p/vim-latex/vim-latex', { 'for': ['tex', 'plaintex'] }
Plug 'mattn/webapi-vim'
Plug 'vim-scripts/Gist.vim', { 'on': 'Gist' }
Plug 'vim-scripts/incsearch.vim'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'zah/nimrod.vim', { 'for': 'nim' }
Plug 'edkolev/tmuxline.vim'
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'ryanss/vim-hackernews', { 'on': 'HackerNews' }
Plug 'spf13/PIV', { 'for': 'php' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'wesQ3/vim-windowswap'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'Raimondi/delimitMate'
Plug 'jez/vim-superman', { 'on': 'SuperMan' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'tpope/vim-liquid', { 'for': 'liquid' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'vim-scripts/a.vim'

call plug#end()
