colorscheme lunaperche

set nocompatible
syntax on
filetype plugin indent on
set path+=**

set number
set relativenumber
set showcmd
set ruler
set laststatus=2

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set scrolloff=10
set nowrap
set nobackup
set nowritebackup
set noswapfile

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_winsize = 20

let mapleader = " "

nnoremap <silent> <C-q> :tabp<CR>
nnoremap <silent> <C-w> :tabn<CR>
nnoremap <silent> <C-n> :tabnew<CR>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>Q :q!<CR>
nnoremap <silent> <leader>e :Lexplore<CR>
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <leader>f :find 
nnoremap <leader>t :! 

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap < <><Left>
