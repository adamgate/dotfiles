" Plugins

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/preservim/nerdtree' ", {'on': 'NERDTreeToggle'}
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/RRethy/nvim-base16' " Base16 Color Schemes
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/preservim/tagbar', {'on': 'TagbarToggle'} " Tagbar for code navigation
Plug 'https://github.com/dkarter/bullets.vim'
Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy Finder, Needs Silversearcher-ag for :Ag
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/glepnir/dashboard-nvim'
Plug 'https://github.com/davidhalter/jedi-vim'
Plug 'github/copilot.vim'
Plug 'https://github.com/mbbill/undotree'

call plug#end()

" General Configuration

set number
set relativenumber
set mouse=a
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set encoding=UTF-8

:colorscheme base16-onedark