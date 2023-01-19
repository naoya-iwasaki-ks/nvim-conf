vim.opt.fenc = "utf-8"

vim.opt.ambiwidth = "single"
vim.opt.filetype = "off"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.cmd([[
  " Language setting
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
  
  set isk+=-
  
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
  
  " sql
  let g:omni_sql_no_default_maps = 1
  
  " clipboarder
  vmap <silent> <leader>y :!putclip; getclip<CR>
  map <silent> <leader>p <esc>o<esc>v:!getclip<CR>
  
  " invert colon semicolon
  nnoremap : ;
  nnoremap ; :
  vnoremap : ;
  vnoremap ; :
  
  if &compatible
    set nocompatible               " Be iMproved
  endif
  
  " Required:
  filetype plugin indent on
  syntax enable
  
  " vue sucks w/ the context_filetype
  autocmd FileType vue syntax sync fromstart
]])
