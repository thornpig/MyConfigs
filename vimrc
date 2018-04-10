""""built-in settings""""

"change leader key
let mapleader = ","

"use system clipboard
set clipboard=unnamed


syntax on
set nocompatible
set backspace=indent,eol,start
set nu
set ruler
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch            " highlight matches
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

set autoindent
set smarttab
set expandtab
set shiftwidth=4


""map dd to deleteing (yanking to black hole register)
nnoremap d "_d
vnoremap d "_d


""""install plugins""""
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'w0rp/ale'
"    Plug 'scrooloose/syntastic'
    Plug 'flazz/vim-colorschemes'
    Plug 'scrooloose/nerdcommenter'
    " Plug 'tpope/vim-commentary'
    Plug 'nathanaelkane/vim-indent-guides'
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'sheerun/vim-polyglot'
    Plug 'nvie/vim-flake8'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-obsession'
call plug#end()

""""plugin settings""""

"vim-colorschemes
colorscheme hybrid

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Use NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=25
let NERDTreeQuitOnOpen=0
map <C-n> :NERDTreeToggle<CR>

" " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
"   let g:NERDCompactSexyComs = 1
" " Align line-wise comment delimiters flush left instead of following code
  let g:NERDDefaultAlign = 'left'

"python highlight
let python_highlight_all=1

"vim-obsession
nnoremap <leader>os :Obsess<CR>








