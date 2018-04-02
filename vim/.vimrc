filetype plugin indent on
set encoding=utf-8
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
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nvie/vim-flake8'

call vundle#end()

" lightline
set laststatus=2
set noshowmode

" 80 columns highlight
" highlight OverLength ctermbg=red ctermfg=darkred guibg=#FFD9D9
" match OverLength /\%121v.\+/

" Heck you arrow keys
nnoremap <Left> :echoe "Heck! Use h"<CR>
nnoremap <Right> :echoe "Heck! Use l"<CR>
nnoremap <Up> :echoe "Heck! Use k"<CR>
nnoremap <Down> :echoe "Heck! Use j"<CR>

" YouCompleteMe
let g:ycm_disable_for_files_larger_than_kb = 100
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" NerdTree
let NERDTreeIgnore = ['__pycache__']
let NERDTreeDirArrows = 1

" NerdCommenter
let g:NERDSpaceDelims = 1

" vim-flake8
let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.conf setf dosini

" Return to last position when re-open a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function! SetupPython()
    " Here, you can have the final say on what is set.  So
    " fixup any settings you don't like.
    setlocal softtabstop=4
    setlocal tabstop=4
    setlocal shiftwidth=4
endfunction
command! -bar SetupPython call SetupPython()

" Lint
let g:syntastic_javascript_checkers = ['eslint']
