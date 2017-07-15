filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
syntax on
set number
set t_Co=256
colorscheme ron
let mapleader = ","
nmap <silent> <leader>m :NERDTreeToggle<CR>

set mouse=a

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

" YouCompleteMe
let g:ycm_disable_for_files_larger_than_kb = 100
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
" NerdTree
let NERDTreeIgnore = ['__pycache__']
" NerdCommenter
let g:NERDSpaceDelims = 1

autocmd BufWritePre * :%s/\s\+$//e

" Return to last position when re-open a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function! SetupPython()
    " Here, you can have the final say on what is set.  So
    " fixup any settings you don't like.
    setlocal softtabstop=2
    setlocal tabstop=2
    setlocal shiftwidth=2
endfunction
command! -bar SetupPython call SetupPython()

