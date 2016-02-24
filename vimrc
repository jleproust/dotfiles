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
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" global options
set updatetime=250

set number
set relativenumber

set list
set listchars=tab:▸-,trail:·

colorscheme dracula
let g:airline_theme='tomorrow'


