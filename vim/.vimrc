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
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'sbdchd/neoformat'

Plugin 'shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'

call vundle#end()

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

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
" NerdTree
let NERDTreeIgnore = ['__pycache__']
" NerdCommenter
let g:NERDSpaceDelims = 1

autocmd BufWritePre * :%s/\s\+$//e

" unite.vim
let g:unite_source_grep_command       = 'ag'
let g:unite_source_grep_default_opts  = '--column --nogroup --nocolor --follow --hidden'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_rec_async_command  = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '--ignore', '*.jpeg', '--ignore', '*.jpg', '--ignore', '*.png', '--ignore', '*.gif', '--ignore', '*.ttf', '-g', '']
nnoremap <C-F> :Unite -start-insert file_rec/async<cr>
nnoremap <C-G> :Unite grep:.<cr>
nnoremap <C-H> :Unite buffer<cr>
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  map <silent><buffer><expr> <C-H> unite#do_action('left')
  map <silent><buffer><expr> <C-L> unite#do_action('right')
  map <silent><buffer><expr> <C-J> unite#do_action('below')
  map <silent><buffer><expr> <C-K> unite#do_action('above')
endfunction

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

