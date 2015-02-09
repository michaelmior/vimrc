set encoding=utf-8
set nocompatible              " be iMproved, required
set wildignorecase
filetype off                  " required

" Intialize vim-plug
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
Plug 'michaeljsmith/vim-indent-object'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/csv.vim'
Plug 'majutsushi/tagbar'
Plug 'nginx/nginx', {'rtp': 'contrib/vim/'}
Plug 'hura/vim-asymptote'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'kien/ctrlp.vim'
Plug 'wlangstroth/vim-racket'
Plug 'guns/vim-clojure-static'
Plug 'w0ng/vim-hybrid'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'valloric/MatchTagAlways'
Plug 'fatih/vim-go'
Plug 'vim-scripts/gnuplot.vim'
Plug 'git://git.code.sf.net/p/vim-latex/vim-latex'
Plug 'mattn/webapi-vim'
Plug 'vim-scripts/Gist.vim'
Plug 'vim-scripts/incsearch.vim'
Plug 'vim-ruby/vim-ruby'

call plug#end()
