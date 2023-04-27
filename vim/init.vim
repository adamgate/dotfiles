"  Put together with help from: https://gist.github.com/subfuzion/7d00a6c919eeffaf6d3dbf9a4eb11d64

"""""""""""""""""""
" Vim-Plug Plugins
"""""""""""""""""""
call plug#begin()

""" Visual """
Plug 'https://github.com/chriskempson/base16-vim'                       " Base16 Color Schemes
Plug 'https://github.com/morhetz/gruvbox'                               " Gruvbox Color Scheme
Plug 'https://github.com/ryanoasis/vim-devicons'                        " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors'                  " Multiple cursors

""" Display """
Plug 'https://github.com/preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'                   " Nerdtree git integration
Plug 'https://github.com/airblade/vim-gitgutter'                        " Show git blame
Plug 'https://github.com/vim-airline/vim-airline'                       " Status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'                " Themes for status bar
Plug 'https://github.com/preservim/tagbar'                              " Displays tags on the right

""" Functional """
Plug 'https://github.com/OmniSharp/omnisharp-vim'                       " For C#
Plug 'https://github.com/tpope/vim-commentary'                          " For Commenting
Plug 'https://github.com/tc50cal/vim-terminal'                          " Vim Terminal
Plug 'http://github.com/tpope/vim-surround'                             " Easily change surrounding quotes, brackets, etc
Plug 'https://github.com/mattn/emmet-vim'                               " Autocompletion for web dev
Plug 'https://github.com/junegunn/fzf.vim'                              " Fuzzy search
Plug 'https://github.com/ervandew/supertab'                             " Extra tab options
Plug 'https://github.com/dmerejkowsky/vim-ale'                          " For linting
Plug 'https://github.com/tpope/vim-fugitive'                            " For git commands

""" Plugins to try """
"  Plug 'https://github.com/godlygeek/tabular'                             " Line up text
"  Plug 'https://github.com/plasticboy/vim-markdown'                       " Markdown support
" Plug  'https://github.com/alexghergh/nvim-tmux-navigation'               " TMUX support (requires TMUX, other repos available)


call plug#end()

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""
" Neovim Settings
"""""""""""""""""""
let mapleader = ","

syntax on

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
:PlugClean!
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
map <C-g> :GitGutterEnable<CR>

" use ;; for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap ;; <Esc>

" Toggle NERDTree
" Can't get <C-Space> by itself to work, so this works as Ctrl - space - space
" https://github.com/neovim/neovim/issues/3101
" http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim#answer-24550772
nnoremap <silent> <Space> :NERDTreeToggle<CR>

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <silent> <leader>tt :terminal<CR>
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
nnoremap <silent> <leader>th :new<CR>:terminal<CR>
tnoremap <C-x> <C-\><C-n><C-w>q

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

"""""""""""""""""""
" Functions
"""""""""""""""""""

""" Switch between light and dark mode """
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

""" Sync NERDTree with current open file """

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()