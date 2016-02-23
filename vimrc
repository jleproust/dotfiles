set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect('bundle/{}/', 'bundle/{}/vim')
call pathogen#helptags()
filetype plugin on

runtime! plugin/sensible.vim

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1

set updatetime=250

set number
set relativenumber

set list
set listchars=tab:▸-,trail:·

colorscheme dracula
let g:airline_theme='tomorrow'
