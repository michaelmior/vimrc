set tabstop=2
set shiftwidth=2
set softtabstop=2

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']

" Enable ESLint only for JavaScript.
let b:ale_linters = ['eslint', 'flow']
