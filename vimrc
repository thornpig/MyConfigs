""""built-in settings""""

"change leader key
let mapleader = ","

"use system clipboard
set clipboard=unnamed

"color setting
set t_Co=256
set termguicolors
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"highlight the column past the width limit (usually 80)
set colorcolumn=81

"make tab show up red. To replace tab with spaces, use :retab.
syn match tab display "\t"
hi link tab Error

"undo persistence
set undodir=~/.vim/undo
set undofile

filetype plugin on
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
set shiftwidth=2


""map dd to deleteing (yanking to black hole register)
nnoremap d "_d
vnoremap d "_d


""""install plugins""""
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'microsoft/python-language-server'
    Plug 'flazz/vim-colorschemes'
    Plug 'scrooloose/nerdcommenter'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-obsession'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'rhysd/vim-clang-format'
    Plug 'junegunn/seoul256.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'plasticboy/vim-markdown'
    Plug 'keith/swift.vim'
    Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

""""plugin settings""""

""vim-colorschemes
colorscheme hybrid


""seoul256
"let g:seoul256_background = 237
"colo seoul256


""vim-obsession
nnoremap <leader>os :Obsess<CR>


""vim-fswitch
au! BufEnter *.{m,mm,c,cc,cpp} let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = './,../include,../inc,reg:/src/include/'
au! BufEnter *.{h,hpp} let b:fswitchdst = 'm,mm,c,cc,cpp' | let b:fswitchlocs = './,../src,../source,reg:/include/src/'
map <C-a> :FSHere<CR>
nmap <silent> <Leader>ah :FSSplitBelow<cr>
nmap <silent> <Leader>av :FSSplitRight<cr>

""fzf-vim
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
