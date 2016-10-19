syntax on
"--------- NeoBundle ---------------------
"NeoBundle 'ruby.vim'
"NeoBundle 'nginx.vim'
"--------- NeoBundle ---------------------
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yajima/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/yajima/.vim/bundle')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('tomasr/molokai')
call dein#add('itchyny/lightline.vim')
" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


" New Setting 2016.09.15
" base
set encoding=utf8
set fencs=utf-8,euc-jp,sjis,iso-2022-jp,latin1
set tabstop=4
set shiftwidth=2
set nobk
set laststatus=2
set so=3
set incsearch
set ignorecase
set smartcase
set expandtab
" Color
colorscheme molokai
" indent
set cindent
"set smartindent
set autoindent
" other
set showmatch
set hlsearch
" ver 8.0用 deleteできないので
set backspace=indent,eol,start

let loaded_matchparen = 1

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" New Settings End

" ターミナルタイプによるカラー設定
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" 
 set t_Co=16
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
elseif &term =~ "xterm-256color" || &term =~ "screen"
 set t_Co=256
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
elseif &term =~ "xterm-color"
 set t_Co=8
 set t_Sf=^[[3%dm
 set t_Sb=^[[4%dm
endif


" StatusLine
set guifont=Ricty\ 10

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode'
      \ }
      \ }

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
