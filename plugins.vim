set encoding=utf-8
set nocompatible              " be iMproved, required
set wildignorecase
filetype off                  " required

" Intialize vim-plug
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
call plug#begin(s:path . '/plugged')

Plug 'dense-analysis/ale'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/Improved-AnsiEsc', { 'on': 'AnsiEsc' }
Plug 'rhysd/clever-f.vim'
Plug 'wellle/context.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'padawan-php/deoplete-padawan', { 'for': 'php' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'cohama/lexima.vim'
Plug 'valloric/MatchTagAlways', { 'for': ['html', 'xml'] }
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/tagbar'
Plug 'wellle/targets.vim'
Plug 'markonm/traces.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'justincampbell/vim-eighties'
Plug 'tpope/vim-fugitive'
Plug 'w0ng/vim-hybrid'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'farmergreg/vim-lastplace'
Plug 'darfink/vim-plist'
Plug 'tpope/vim-repeat'
Plug 'lbrayner/vim-rzip'
Plug 'mhinz/vim-signify'
Plug 'jez/vim-superman', { 'on': 'SuperMan' }
Plug 'tpope/vim-surround'
Plug 'rbonvall/vim-textobj-latex', { 'for': ['tex', 'plaintex'] }
Plug 'rhysd/vim-textobj-ruby', { 'for': 'ruby' }
Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-unimpaired'
Plug 'wesQ3/vim-windowswap'

" Add filetype plugins
Plug 'hura/vim-asymptote',                          { 'for': 'asy' }
Plug 'guns/vim-clojure-static',                     { 'for': 'clojure' }
Plug 'cstrahan/vim-capnp',                          { 'for': 'capnp' }
Plug 'kchmck/vim-coffee-script',                    { 'for': 'coffee' }
Plug 'chrisbra/csv.vim',                            { 'for': 'csv' }
Plug 'elubow/cql-vim',                              { 'for': 'cql' }
Plug 'lambdalisue/vim-cython-syntax',               { 'for': 'cython' }
Plug 'ekalinin/Dockerfile.vim',                     { 'for': 'Dockerfile' }
Plug 'dcharbon/vim-flatbuffers',                    { 'for': 'fbs' }
Plug 'dag/vim-fish',                                { 'for': 'fish' }
Plug 'fatih/vim-go',                                { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'vim-scripts/gnuplot.vim',                     { 'for': 'gnuplot' }
Plug 'othree/html5.vim',                            { 'for': 'html' }
Plug 'digitaltoad/vim-jade',                        { 'for': 'jade' }
Plug 'pangloss/vim-javascript',                     { 'for': 'javascript' }
Plug 'MaxMEllon/vim-jsx-pretty',                    { 'for': 'javascript' }
Plug 'elzr/vim-json',                               { 'for': 'json' }
Plug 'udalov/kotlin-vim',                           { 'for': 'kotlin' }
Plug 'groenewege/vim-less',                         { 'for': 'less' }
Plug 'tpope/vim-liquid',                            { 'for': 'liquid' }
Plug 'plasticboy/vim-markdown',                     { 'for': 'mkd' }
Plug 'chr4/nginx.vim',                              { 'for': 'nginx' }
Plug 'zah/nimrod.vim',                              { 'for': 'nim' }
Plug 'c9s/perlomni.vim',                            { 'for': 'perl' }
Plug 'spf13/PIV',                                   { 'for': 'php' }
Plug 'jalvesaq/Nvim-R',                             { 'for': 'r' }
Plug 'wlangstroth/vim-racket',                      { 'for': 'racket' }
Plug 'vim-ruby/vim-ruby',                           { 'for': 'ruby' }
Plug 'rust-lang/rust.vim',                          { 'for': ['rust', 'rust.rustpeg'] }
Plug 'treycordova/rustpeg.vim',                     { 'for': 'rust.rustpeg' }
Plug 'derekwyatt/vim-scala',                        { 'for': 'scala' }
Plug 'cakebaker/scss-syntax.vim',                   { 'for': 'scss' }
Plug 'lervag/vimtex',                               { 'for': ['tex', 'plaintex'] }
Plug 'cespare/vim-toml',                            { 'for': 'toml' }
Plug 'leafgarland/typescript-vim',                  { 'for': 'ts' }
Plug 'gittup/tup',                                  { 'for': 'tup', 'rtp': 'contrib' }
Plug 'posva/vim-vue',                               { 'for': 'vue' }

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" tmux-specific plugins
if strlen($TMUX)
  Plug 'benmills/vimux'
  Plug 'wellle/tmux-complete.vim'
  Plug 'sjl/vitality.vim'

  " Disabled since configuration has been manually applied
  " Plug 'edkolev/tmuxline.vim'
endif

call plug#end()
