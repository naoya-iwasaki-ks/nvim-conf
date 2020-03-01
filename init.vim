" Language setting
set fenc=utf-8

set ambiwidth=double

set noshowmode
filetype off

set showcmd

set number relativenumber

" no backup
set nobackup
set nowritebackup
set noswapfile

" on tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set autoindent
set smartindent

set ignorecase
set smartcase
set incsearch

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" sql
let g:omni_sql_no_default_maps = 1

" dein settings
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible               " Be iMproved
endif

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim s:dein_repo_dir
  endif
  " Required:
  let &runtimepath = s:dein_repo_dir . "," . &runtimepath
endif 

" Required:
if dein#load_state(s:dein_dir)
  let s:config_path = fnamemodify(expand('<sfile>'), ':h') . '/dein'

  let s:toml_file = s:config_path . '/plugin.toml'
  let s:lazy_toml_file = s:config_path . '/plugin_lazy.toml'

  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" vue sucks w/ the context_filetype
autocmd FileType vue syntax sync fromstart

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" dein end
