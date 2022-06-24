"""""""""""""""""""
" Vim-Plug Plugins
"""""""""""""""""""
call plug#begin()

Plug 'https://github.com/chriskempson/base16-vim'           " Base16 Color Schemes
" Plug 'https://github.com/morhetz/gruvbox'                   " Gruvbox Color Scheme
Plug 'https://github.com/preservim/nerdtree' {'on': 'NERDTreeToggle'}
Plug 'https://github.com/airblade/vim-gitgutter'            " Show git blame
Plug 'https://github.com/vim-airline/vim-airline'           " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'    " Themes for status bar
Plug 'https://github.com/preservim/tagbar'                  " Displays tags on the right
Plug 'http://github.com/tpope/vim-surround'                 " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary'              " For Commenting gcc & gc
Plug 'https://github.com/ryanoasis/vim-devicons'            " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal'              " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors'      " CTRL + N for multiple cursors

call plug#end()


"""""""""""""""""""
" Neovim Settings
"""""""""""""""""""
:set number
" :set relativenumber
:set mouse=a
:set autoindent
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set smarttab
:set encoding=UTF-8

:set splitright
:set splitbelow


"""""""""""""""""""
" Plugin Settings
"""""""""""""""""""
:PlugCLean!
:PlugInstall
:q
:colorscheme base16-gruvbox-dark-hard
let g:airline_theme='base16_gruvbox_dark_hard'


"""""""""""""""""""
" Keymapping
"
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping#answer-3776182
" http://stackoverflow.com/questions/22849386/difference-between-nnoremap-and-inoremap#answer-22849425
"""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-g> :GitGutterEnable<CR>

" use ;; for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap ;; <Esc>

" Toggle NERDTree
" Can't get <C-Space> by itself to work, so this works as Ctrl - space - space
" https://github.com/neovim/neovim/issues/3101
" http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim#answer-24550772
"nnoremap <C-Space> :NERDTreeToggle<CR>
"nmap <C-@> <C-Space>
nnoremap <silent> <Space> :NERDTreeToggle<CR>

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <silent> <leader>tt :terminal<CR>
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
nnoremap <silent> <leader>th :new<CR>:terminal<CR>
tnoremap <C-x> <C-\><C-n><C-w>q

" Switch between light and dark mode

"""""""""""""""""""
" Functions
"""""""""""""""""""
function! Light()
    echom "entering light mode"
    :colorscheme base16-gruvbox-light-hard
    :AirlineTheme base16-gruvbox-light-hard
endfunction

function! Dark()
    echom "entering dark mode"
    colorscheme base16-gruvbox-dark-hard
    :AirlineTheme base16-gruvbox-dark-hard
endfunction

function! ToggleLightDark()
  if &bg ==# "light"
    call Dark()
  else
    call Light()
  endif
endfunction

nnoremap <leader>c :call ToggleLightDark()<CR>