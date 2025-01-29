local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General settings
vim.opt.undofile = true
vim.opt.title = true
vim.opt.hidden = true
vim.opt.number = true
-- vim.opt.relativenumber = true -- Uncomment if you want relative numbers
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 100
vim.opt.shortmess:append("c")
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = "a"

-- Key mappings
-- Save & exit like in most GUI editors
vim.keymap.set('n', '<C-S>', ':update<CR>', { silent = true })
vim.keymap.set('v', '<C-S>', '<Esc>:update<CR>', { silent = true })
vim.keymap.set('i', '<C-S>', '<Esc>:update<CR>', { silent = true })
vim.keymap.set('n', '<C-Q>', ':quit<CR>', { silent = true })
vim.keymap.set('v', '<C-Q>', '<Esc>:quit<CR>', { silent = true })
vim.keymap.set('i', '<C-Q>', '<C-O>:quit<CR>', { silent = true })
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { silent = true })

vim.keymap.set('n', '<C-l>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<C-n>', ':set relativenumber!<CR>', { silent = true })
vim.keymap.set('i', '<C-n>', '<Esc>:set relativenumber!<CR>a', { silent = true })

vim.keymap.set('n', '&', ':&&<CR>', { silent = true })
vim.keymap.set('x', '&', ':&&<CR>', { silent = true })
vim.keymap.set('n', 'Y', 'y$', { silent = true })
vim.keymap.set('n', 'Q', '@q', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })

-- Save to system clipboard
vim.keymap.set('n', '<leader>y', '"+y', { silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { silent = true })
vim.keymap.set('n', '<leader>Y', '"+Y', { silent = true })
vim.keymap.set('v', '<leader>Y', '"+Y', { silent = true })
vim.keymap.set('n', '<leader>p', '"+p', { silent = true })
vim.keymap.set('v', '<leader>p', '"+p', { silent = true })
vim.keymap.set('n', '<leader>P', '"+P', { silent = true })
vim.keymap.set('v', '<leader>P', '"+P', { silent = true })

-- Use arrows to navigate on wrapped lines & change buffers
vim.keymap.set('i', '<Up>', '<C-O>gk', { silent = true })
vim.keymap.set('i', '<Down>', '<C-O>gj', { silent = true })
vim.keymap.set('n', '<Up>', 'gk', { silent = true })
vim.keymap.set('n', '<Down>', 'gj', { silent = true })
vim.keymap.set('v', '<Up>', 'gk', { silent = true })
vim.keymap.set('v', '<Down>', 'gj', { silent = true })

-- UndoTree and Neotree commands
vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<F1>', ':Neotree filesystem reveal left toggle<CR>', { silent = true })
vim.keymap.set('n', '<F2>', ':Oil --float<CR>', { silent = true })

-- Gutentags settings
vim.g.gutentags_cache_dir = '~/.tags'
vim.g.gutentags_file_list_command = 'find . -type f -name "*.rb"'

-- UndoTree settings
vim.g.undotree_WindowLayout = 2
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_SplitWidth = 50

-- Disable Perl provider
vim.g.loaded_perl_provider = 0

-- Buffer navigation and reordering
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true })

-- Goto buffer by number
for i = 1, 9 do
  vim.keymap.set('n', '<A-'..i..'>', '<Cmd>BufferGoto '..i..'<CR>', { silent = true })
end
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', { silent = true })

-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', { silent = true })

-- Restore buffer
vim.keymap.set('n', '<A-r>', '<Cmd>BufferRestore<CR>', { silent = true })

require("lazy").setup({
  spec = {
    { import = 'plugins' },

    { "tpope/vim-repeat" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-surround" },
    { "tpope/vim-unimpaired" },
    { "numToStr/Comment.nvim" },
    { "tpope/vim-endwise" },
    { "bronson/vim-visual-star-search" },
    { "godlygeek/tabular" },
    { "farmergreg/vim-lastplace" },
    { "lervag/file-line" },
    { "nvim-tree/nvim-web-devicons" },
    { "romgrk/barbar.nvim" },
    { "nvim-neo-tree/neo-tree.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "MunifTanjim/nui.nvim" },
    { "junegunn/vim-peekaboo" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "ludovicchabant/vim-gutentags" },
    { "mbbill/undotree" },
  }
})
