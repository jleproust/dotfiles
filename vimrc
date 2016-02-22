set nocompatible
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
syntax on

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
