-- Save & exit like in most GUI editors
vim.keymap.set({'n', 'i'}, '<C-s>', '<Esc><cmd>update<CR>', { desc = 'Save' })
vim.keymap.set('n', '<C-q>', '<cmd>quit<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<C-c>', function()
  if vim.fn.confirm("Quit all?", "&Yes\n&No") == 1 then
    vim.cmd('quitall')
  end
end, { desc = 'Quit all' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<Tab>', "<C-w>w", { desc = 'Cycle windows' })
vim.keymap.set('n', '<C-l>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight' })
vim.keymap.set('n', '<C-;>', '<cmd>set relativenumber!<CR>', { desc = 'Toggle relative number' })

vim.keymap.set('n', '<C-2>', function()
  local last_cmd = vim.fn.getreg(':')
  if last_cmd ~= "" then
    vim.cmd(last_cmd)
  else
    print("No previously used Ex command")
  end
end, { silent = false, desc = "Repeat last Ex command" })

vim.keymap.set('n', 'Q', '@q')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = 'Find references' })
vim.keymap.set("n", ")", function() require('nvim-treesitter.incremental_selection').scope_incremental() end, { desc = 'Treesitter scope increment' })
vim.keymap.set("n", "(", function() require('nvim-treesitter.incremental_selection').scope_decremental() end, { desc = 'Treesitter scope decrement' })

-- Save to system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P')

-- UndoTree and Neotree commands
vim.keymap.set('n', '<F1>', '<cmd>Neotree filesystem reveal_force_cwd left toggle<CR>', { desc = 'toggle Neotree' })
vim.keymap.set('n', '<F2>', function() require('oil').toggle_float() end, { desc = 'toggle Oil' })
vim.keymap.set('n', '<F3>', '<cmd>Neogit<CR>', { desc = 'toggle Neogit' })

vim.keymap.set('n', '<F4>', function()
  local bufname = vim.fn.bufname('%')
  if bufname:match("^diffview") then  -- Check if the buffer name starts with "Diffview"
    vim.cmd('DiffviewClose')  -- Close Diffview if it's open
  else
    vim.cmd('DiffviewFileHistory')   -- Open Diffview if it's closed
  end
end, { desc = 'toggle diffview history' })

vim.keymap.set('n', '<F5>', '<cmd>UndotreeToggle<CR>', { desc = 'toggle Undotree' })

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

vim.keymap.set('n', '<F7>', '<cmd>GrugFar<CR>', { desc = 'toggle Grugfar' })
vim.keymap.set('n', '<F8>', '<cmd>AerialToggle left<CR>', { desc = 'toggle Aerial' })
vim.keymap.set({ "n", "v" }, '<F9>', ':<C-u>CopilotChatToggle<CR>', { desc = 'toggle CopilotChat' })
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame<CR>', { desc = 'Git blame' })
vim.keymap.set('n', '<leader>m', '<cmd>Grapple open_tags<CR>', { desc = 'Open Grapple tags' })

vim.keymap.set('n', '<leader>M', function()
  -- Collect all non-empty buffer names
  local buffers = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf)
    if name ~= "" then
      table.insert(buffers, name)
    end
  end

  -- Launch fzf-lua with the list of buffers
  require("fzf-lua").fzf_exec(buffers, {
    prompt = 'Select buffer for Grapple tag> ',
    actions = {
      ['default'] = function(selected)
        local choice = selected[1]
        require("grapple").tag({ path = choice })
      end,
    },
  })
end, { desc = 'Set Grapple tag' })

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
vim.keymap.set("n", "<C-W>\\", '<cmd>vsplit | terminal<CR>', { desc = 'Split terminal' })
