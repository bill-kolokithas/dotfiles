set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/aftersyntaxc.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-vinegar'
Plugin 'bronson/vim-visual-star-search'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-lastpat'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'tommcdo/vim-exchange'

filetype plugin indent on
syntax on
set number
set tabstop=4
set shiftwidth=4
set laststatus=2
set noshowmode
set wildmenu
set wildmode=full
set hidden
set showcmd
set modeline
set relativenumber
set ttimeoutlen=0
set regexpengine=1

let mapleader=" "
let g:ycm_confirm_extra_conf=0
let g:easytags_updatetime_warn=0
let g:airline#extensions#whitespace#enabled=0
let g:EasyMotion_leader_key = '<Leader>'
let g:ycm_autoclose_preview_window_after_completion=1
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsDontReverseSearchPath=1
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:ycm_collect_identifiers_from_tags_files = 1
autocmd FileType c set commentstring=//\ %s

noremap <C-l> :nohlsearch<CR>
nnoremap Y y$
nnoremap Q @q
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj
noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <Esc>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nmap <leader><Space> i<space><esc>

augroup vimrc_autocmds
	autocmd BufEnter * highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd BufEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd BufEnter * 2match ExtraWhitespace /^\t*\zs \+/
augroup END

set background=dark
colorscheme solarized
