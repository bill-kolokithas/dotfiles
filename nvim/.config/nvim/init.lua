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
vim.opt.mouse = ''
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldenable = false
vim.opt.foldlevel = 1
vim.opt.sessionoptions:append({ "winpos" })

vim.opt.langmap = "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

-- Key mappings
-- Save & exit like in most GUI editors
vim.keymap.set('n', '<C-S>', ':update<CR>')
vim.keymap.set('v', '<C-S>', '<Esc>:update<CR>')
vim.keymap.set('i', '<C-S>', '<Esc>:update<CR>')
vim.keymap.set('n', '<C-Q>', ':quit<CR>')
vim.keymap.set('v', '<C-Q>', '<Esc>:quit<CR>')
vim.keymap.set('i', '<C-Q>', '<C-O>:quit<CR>')
vim.keymap.set('n', '<C-C>', ':quitall<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<C-l>', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-i>', ':set relativenumber!<CR>')
vim.keymap.set('i', '<C-i>', '<Esc>:set relativenumber!<CR>a')

vim.keymap.set('n', '@', function()
  local last_cmd = vim.fn.getreg(':')
  if last_cmd ~= "" then
    vim.cmd(last_cmd)
  else
    print("No previously used Ex command")
  end
end, { silent = false, desc = "Repeat last Ex command" })

vim.keymap.set('n', '&', ':&&<CR>')
vim.keymap.set('x', '&', ':&&<CR>')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', 'Q', '@q')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = 'Find references' })
vim.keymap.set("n", ")", ":lua require('nvim-treesitter.incremental_selection').scope_incremental()<CR>", { desc = 'Treesitter scope increment' })
vim.keymap.set("n", "(", ":lua require('nvim-treesitter.incremental_selection').scope_decremental()<CR>", { desc = 'Treesitter scope decrement' })


-- Save to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('v', '<leader>Y', '"+Y')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>P', '"+P')

-- Use arrows to navigate on wrapped lines & change buffers
vim.keymap.set('i', '<Up>', '<C-O>gk')
vim.keymap.set('i', '<Down>', '<C-O>gj')
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('v', '<Up>', 'gk')
vim.keymap.set('v', '<Down>', 'gj')

-- UndoTree and Neotree commands
vim.keymap.set('n', '<F1>', ':Neotree filesystem reveal_force_cwd left toggle<CR>', { desc = 'toggle Neotree' })
vim.keymap.set('n', '<F2>', function() require('oil').toggle_float() end, { desc = 'toggle Oil' })
vim.keymap.set('n', '<F3>', ':Neogit<CR>', { desc = 'toggle Neogit' })

vim.keymap.set('n', '<F4>', function()
  local bufname = vim.fn.bufname('%')
  if bufname:match("^diffview") then  -- Check if the buffer name starts with "Diffview"
    vim.cmd('DiffviewClose')  -- Close Diffview if it's open
  else
    vim.cmd('DiffviewFileHistory')   -- Open Diffview if it's closed
  end
end, { desc = 'toggle diffview history' })

vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>', { desc = 'toggle Undotree' })

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

vim.keymap.set('n', '<F7>', ':GrugFar<CR>', { desc = 'toggle Grugfar' })
vim.keymap.set('n', '<F8>', ':AerialToggle left<CR>', { desc = 'toggle Aerial' })
vim.keymap.set({ "n", "v" }, '<F9>', ':<C-U>CopilotChatToggle<CR>', { desc = 'toggle CopilotChat' })

vim.keymap.set('n', '<leader>gb', ':Gitsigns blame<CR>', { desc = 'Git blame' })
vim.keymap.set('n', '<leader>go', function() require('snacks').gitbrowse() end, { desc = 'Git open file' })
vim.keymap.set('n', '<leader>n', function() require('snacks').notifier.show_history() end, { desc = 'Notify history' })
vim.keymap.set('n', '<leader>m', ':Grapple open_tags<CR>', { desc = 'Open Grapple tags' })
vim.keymap.set('n', '<leader>M', ':GrappleTagBuffer', { desc = 'Set Grapple tag' })

vim.api.nvim_create_user_command(
  "GrappleTagBuffer",
  function(opts)
    -- This calls Grapple's tag functionality with a custom "buffer=" scope.
    require("grapple").tag({ path = opts.args })
  end,
  {
    nargs = 1,
    desc = "Tag buffer with Grapple",
    complete = function(arglead)
      local matches = {}
      -- Loop through all buffers and collect their names (as potential IDs)
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local name = vim.api.nvim_buf_get_name(buf)
        -- Only include buffers that have a name
        if name ~= "" and name:find(arglead) then
          table.insert(matches, name)
        end
      end
      return matches
    end
  }
)

-- Gutentags settings
vim.g.gutentags_cache_dir = '~/.tags'

-- UndoTree settings
vim.g.undotree_WindowLayout = 2
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_SplitWidth = 50

-- Goto buffer by number
for i = 1, 9 do
  vim.keymap.set('n', '<A-'..i..'>', '<Cmd>BufferGoto '..i..'<CR>')
end

vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>')
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>')
vim.keymap.set('n', '<A-r>', '<Cmd>BufferRestore<CR>')
vim.keymap.set('n', '<A-f>', '<Cmd>BufferPick<CR>')
vim.keymap.set('n', '<A-d>', '<Cmd>BufferPickDelete<CR>')

local function toggle_maximize()
  if vim.t.maximized then
    vim.cmd("wincmd =") -- Restore window layout
    vim.t.maximized = false
  else
    vim.cmd("wincmd _ | wincmd |") -- Maximize current window
    vim.t.maximized = true
  end
end

vim.keymap.set("n", "<C-W>m", toggle_maximize, { desc = 'Maximize window' })
vim.keymap.set("n", "<C-W>\\", ':vsplit | terminal<CR>', { desc = 'Split terminal' })

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end
})

-- lua/plugins/init.lua
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
