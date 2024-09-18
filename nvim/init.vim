set number  " add line numbers
"set relativenumber  " add relative line numbers
set clipboard=unnamedplus  " using system clipboard
set mouse=a  " enable mouse click

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'  " For Commenting gcc & gc
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/nanotech/jellybeans.vim'  " vim theme

set encoding=UTF-8

call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

colorscheme jellybeans
