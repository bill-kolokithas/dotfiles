call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'lifepillar/vim-solarized8'
Plug 'bronson/vim-visual-star-search'
Plug 'godlygeek/tabular'
Plug 'farmergreg/vim-lastplace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'lervag/file-line'
Plug 'mboughaba/i3config.vim'

call plug#end()

set undofile
set title
set hidden
set number
" set relativenumber
set ignorecase
set smartcase
set splitbelow
set splitright
set updatetime=400
set shortmess+=c
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set mouse=

let mapleader=" "

" Save & exit like in most GUI editors
noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <Esc>:update<CR>
inoremap <silent> <C-S> <Esc>:update<CR>
noremap  <silent> <C-Q> :quit<CR>
vnoremap <silent> <C-Q> <Esc>:quit<CR>
inoremap <silent> <C-Q> <C-O>:quit<CR>
tnoremap <C-\> <C-\><C-n>

noremap <C-l> :nohlsearch<CR>
noremap <C-n> :set relativenumber!<CR>
inoremap <C-n> <Esc>:set relativenumber!<CR>a
nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap Y y$
nnoremap Q @q
vnoremap < <gv
vnoremap > >gv

" Save to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" Use arrows to navigate on wrapped lines & change buffers
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>g :BCommits<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>s :Rg <C-R><C-W><CR>
nmap <Leader>S :Rg <CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

set background=dark
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
colorscheme solarized8_high

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()

nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nnoremap <silent> <leader>a :<C-u>CocList diagnostics<cr>
command! -nargs=0 Format :call CocAction('format')

let g:gutentags_cache_dir = '~/.tags'
let g:gutentags_file_list_command = 'find * -type f -name "*.rb"'

nnoremap <F5> :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 50

let g:loaded_perl_provider = 0

lua require('config')

autocmd BufEnter * let &titlestring = "%t %r%m (%{expand('%:~:h')}) - NVIM"
