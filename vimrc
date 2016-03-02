" just in case
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

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'LightLineModified',
    \   'readonly': 'LightLineReadonly',
    \   'fugitive': 'LightLineFugitive',
    \   'filename': 'LightLineFilename',
    \   'fileformat': 'LightLineFileformat',
    \   'filetype': 'LightLineFiletype',
    \   'fileencoding': 'LightLineFileencoding',
    \   'mode': 'LightLineMode',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

function! LightLineModified()
  return &ft =~ 'help\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|gundo' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" colors
colorscheme dracula

" global options
set updatetime=250
set visualbell
set hidden
set laststatus=2
set nostartofline
set history=1000
set whichwrap=<,>,[,]
set number
set relativenumber
set list
set listchars=tab:▸-,trail:·,nbsp:·
set wrap
set linebreak
set wildmenu
set wildmode=list:full
set mouse=a

if v:version >= 703
    set undodir=~/.vim/undo
    set undofile

    set colorcolumn=+1
endif

set directory=~/.vim/swaps//

set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set ignorecase
set smartcase

set foldmethod=indent
set foldlevel=12

set viewoptions=cursor,folds,unix,slash
set viewdir=~/.vim/views//
au BufWritePost,BufLeave,WinLeave ?* mkview
au BufReadPre ?* silent loadview

let mapleader=' '

map <Leader>s :source ~/.vimrc<CR>
