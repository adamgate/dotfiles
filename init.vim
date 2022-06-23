" Plugins

call plug#begin('~/AppData/Local/nvim-data/site/autoload/plug.vim')

Plug 'http://github.com/tpope/vim-surround'       " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary'    " For Commenting gcc & gc
Plug 'https://github.com/preservim/nerdtree'      ", {'on': 'NERDTreeToggle'}
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ryanoasis/vim-devicons'  " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal'    " Vim Terminal
Plug 'https://github.com/morhetz/gruvbox'         " Gruvbox Color Scheme
Plug 'https://github.com/preservim/tagbar', {'on': 'TagbarToggle'} " Tagbar for code navigation

call plug#end()

" General Configuration

set number
" set relativenumber
set mouse=a
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set encoding=UTF-8

:colorscheme base16-onedark