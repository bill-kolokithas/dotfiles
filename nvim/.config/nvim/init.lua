local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General settings
vim.opt.undofile = true
vim.opt.title = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 100
vim.opt.shortmess:append("c")
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.sessionoptions:append({ "winpos" })

vim.opt.langmap = "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

-- Key mappings
-- Save & exit like in most GUI editors
vim.keymap.set('n', '<C-S>', ':update<CR>', { silent = true })
vim.keymap.set('v', '<C-S>', '<Esc>:update<CR>', { silent = true })
vim.keymap.set('i', '<C-S>', '<Esc>:update<CR>', { silent = true })
vim.keymap.set('n', '<C-Q>', ':quit<CR>', { silent = true })
vim.keymap.set('v', '<C-Q>', '<Esc>:quit<CR>', { silent = true })
vim.keymap.set('i', '<C-Q>', '<C-O>:quit<CR>', { silent = true })
vim.keymap.set('n', '<C-B>', ':quitall<CR>', { silent = true, desc = "Quit all" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })

vim.keymap.set('n', '<C-l>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<C-i>', ':set relativenumber!<CR>', { silent = true })
vim.keymap.set('i', '<C-i>', '<Esc>:set relativenumber!<CR>a', { silent = true })

vim.keymap.set('n', '@', function()
  local last_cmd = vim.fn.getreg(':')
  if last_cmd ~= "" then
    vim.cmd(last_cmd)
  else
    print("No previously used Ex command")
  end
end, { silent = false, desc = "Repeat last Ex command" })

vim.keymap.set('n', '&', ':&&<CR>', { silent = true })
vim.keymap.set('x', '&', ':&&<CR>', { silent = true })
vim.keymap.set('n', 'Y', 'y$', { silent = true })
vim.keymap.set('n', 'Q', '@q', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = 'Go to definition' })

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
vim.keymap.set('n', '<F1>', ':Neotree filesystem reveal_force_cwd left toggle<CR>', { silent = true, desc = 'toggle Neotree' })
vim.keymap.set('n', '<F2>', function() require('oil').toggle_float() end, { silent = true, desc = 'toggle Oil' })
vim.keymap.set('n', '<F3>', ':Neogit<CR>', { silent = true, desc = 'toggle Neogit' })

vim.keymap.set('n', '<F4>', function()
  local bufname = vim.fn.bufname('%')
  if bufname:match("^diffview") then  -- Check if the buffer name starts with "Diffview"
    vim.cmd('DiffviewClose')  -- Close Diffview if it's open
  else
    vim.cmd('DiffviewFileHistory')   -- Open Diffview if it's closed
  end
end, { silent = true, desc = 'toggle diffview history' })

vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', { silent = true, desc = 'toggle Undotree' })

local dim_enabled = false
vim.keymap.set("n", "<F6>", function()
  local Snacks = require("snacks")

  if dim_enabled then
    Snacks.dim.disable()
    dim_enabled = false
  else
    Snacks.dim.enable()
    dim_enabled = true
  end
end, { desc = "Toggle dim" })

vim.keymap.set('n', '<F7>', ':GrugFar<CR>', { silent = true, desc = 'toggle Grugfar' })
vim.keymap.set('n', '<F8>', ':AerialToggle left<CR>', { silent = true, desc = 'toggle Aerial' })
vim.keymap.set({ "n", "v" }, '<F9>', ':<C-U>CopilotChatToggle<CR>', { silent = true, desc = 'toggle CopilotChat' })

-- Gutentags settings
vim.g.gutentags_cache_dir = '~/.tags'
vim.g.gutentags_file_list_command = 'find . -type f -name "*.rb"'

-- UndoTree settings
vim.g.undotree_WindowLayout = 2
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_SplitWidth = 50

-- Goto buffer by number
for i = 1, 9 do
  vim.keymap.set('n', '<A-'..i..'>', '<Cmd>BufferGoto '..i..'<CR>', { silent = true })
end

vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', { silent = true })
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', { silent = true })
vim.keymap.set('n', '<A-r>', '<Cmd>BufferRestore<CR>', { silent = true })
vim.keymap.set('n', '<A-f>', '<Cmd>BufferPick<CR>', { silent = true })
vim.keymap.set('n', '<A-d>', '<Cmd>BufferPickDelete<CR>', { silent = true })

local function toggle_maximize()
  if vim.t.maximized then
    vim.cmd("wincmd =") -- Restore window layout
    vim.t.maximized = false
  else
    vim.cmd("wincmd _ | wincmd |") -- Maximize current window
    vim.t.maximized = true
  end
end

vim.keymap.set("n", "<C-W>m", toggle_maximize, { silent = true })

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end
})

require("lazy").setup({
  spec = {
    { import = 'plugins' }
  },
  change_detection = {
    enabled = false,
    notify = false
  },
  install = { colorscheme = { "tokyonight-night" } },
})

vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff", bg = "#ff0000", bold = true })
