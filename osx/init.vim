" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'edkolev/tmuxline.vim'
Plug 'mattn/emmet-vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Add plugins to &runtimepath
call plug#end()

" NeoVim settings
syntax enable
set number
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set expandtab
set softtabstop=4
set ruler
set clipboard=unnamed
set mouse=a
set lazyredraw
set cursorline
set ttyfast
"set list lcs=space:·,tab:▸·

" hide default mode indicaator
set noshowmode

" remove trailing white spaces on :w (save)
autocmd BufWritePre * :%s/\s\+$//e

" Use ctrl-[hjkl] to navigate splits
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Map : to ;
nnoremap ; :

" Map leader from / to ,
let mapleader = ","

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" color scheme
" colorscheme Tomorrow-Night-Eighties
set background=dark
colorscheme solarized

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" airline setting
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline#extensions#tabline#enabled = 1
" no arrows
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" tmuxline settings
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'win': '#I:#W',
        \ 'cwin': '#I:#W',
        \ 'x': '%H:%M %d-%b-%y',
        \ 'z': '#h',
        \ 'options': {
        \'status-justify': 'left'}
        \}

" nerdtree settings
map <C-i> :NERDTreeToggle<CR>
" start with nerdtree open
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close all if nerdtree is last window open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Tagbar
nmap <C-o> :TagbarToggle<CR>

" nerdtree-tabs
" let g:nerdtree_tabs_open_on_console_startup=1

" emmet-vim
let g:user_emmet_leader_key='<leader>'

" ctrlp
let g:ctrlp_map = '<c-p>'

" deoplete
let g:deoplete#enable_at_startup = 1

" python3 support
let g:python3_host_prog = '/usr/local/Cellar/python3/3.5.0/bin/python3'

