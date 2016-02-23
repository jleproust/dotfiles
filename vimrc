set nocompatible
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on

filetype plugin on

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set updatetime=250

set number
