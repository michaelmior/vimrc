set encoding=utf-8
set nocompatible              " be iMproved, required
set wildignorecase
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'bling/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tmhedberg/matchit'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/csv.vim'
Plugin 'majutsushi/tagbar'
Plugin 'nginx/nginx', {'rtp': 'contrib/vim/'}
Plugin 'hura/vim-asymptote'
Plugin 'bogado/file-line'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'guns/vim-clojure-static'
Plugin 'w0ng/vim-hybrid'
Plugin 'AndrewRadev/splitjoin.vim'
