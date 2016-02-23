" let's be serious
set nocompatible

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('bundle/{}/', 'bundle/{}/vim')
call pathogen#helptags()
filetype plugin on

" load sensible now, so we can override options after
runtime! plugin/sensible.vim

" plugin options
let g:ackhighlight = 1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" global options
set updatetime=250

set number
set relativenumber

set list
set listchars=tab:▸-,trail:·

colorscheme dracula
let g:airline_theme='tomorrow'


