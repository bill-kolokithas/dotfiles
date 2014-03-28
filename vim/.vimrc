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
Plugin 'tpope/vim-abolish'
Plugin 'freestyl3r/a.vim'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-vinegar'
Plugin 'bronson/vim-visual-star-search'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-function'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'tommcdo/vim-exchange'

filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set laststatus=2
set noshowmode
set wildmenu
set wildmode=full
set hidden
set showcmd
set modeline
set number
set relativenumber
set ttimeoutlen=0
set ignorecase
set smartcase
set hlsearch
set incsearch
set regexpengine=1

" Set up persistent undo
if isdirectory($HOME . '/.cache/vim-undo') == 0
	:silent !mkdir -p ~/.cache/vim-undo > /dev/null 2>&1
endif

set undodir=~/.cache/vim-undo
set undofile

let mapleader=" "
let g:ycm_confirm_extra_conf=0
let g:easytags_updatetime_warn=0
let g:airline#extensions#whitespace#enabled=0
let g:EasyMotion_leader_key = '<Leader>'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1

" Change ultisnips hotkeys to not collide with youcompleteme
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsDontReverseSearchPath=1
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

noremap <C-l> :nohlsearch<CR>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap Y y$
nnoremap Q @q
vnoremap < <gv
vnoremap > >gv
nmap <leader><Space> i<space><esc>

" Enable very magic regex by default
nnoremap / /\v
nnoremap ? ?\v
cnoremap %s/ %s/\v
cnoremap g/ g/\v
cnoremap g!/ g!/\v

" Use arrows to navigate on wrapped lines & change buffers
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

" Save & exit like in most GUI editors
noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <Esc>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
noremap  <silent> <C-Q> :quit<CR>
vnoremap <silent> <C-Q> <Esc>:quit<CR>
inoremap <silent> <C-Q> <C-O>:quit<CR>

" Mappings to integrate with system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
set pastetoggle=<F8>

" Highlight starting & trailing whitespace
augroup vimrc_autocmds
	autocmd BufEnter * highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd BufEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd BufEnter * 2match ExtraWhitespace /^\t*\zs \+/
augroup END

autocmd FileType c set commentstring=//\ %s

set background=dark
colorscheme solarized
