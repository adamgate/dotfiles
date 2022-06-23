" Plugins

call plug#begin()

Plug 'https://github.com/morhetz/gruvbox'         " Gruvbox Color Scheme
Plug 'https://github.com/preservim/nerdtree'      ", {'on': 'NERDTreeToggle'}
Plug 'https://github.com/airblade/vim-gitgutter'  " Show git blame
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/preservim/tagbar'        " Displays tags on the right
Plug 'http://github.com/tpope/vim-surround'       " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary'    " For Commenting gcc & gc
Plug 'https://github.com/ryanoasis/vim-devicons'  " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal'    " Vim Terminal

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

:colorscheme gruvbox
:AirlineTheme gruvbox