return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#c27029", bg = "NONE" })

      local gitsigns = require('gitsigns')

      local function map(mode, l, r, desc, opts)
        opts = opts or {}
        opts.buffer = bufnr
        if desc then opts.desc = desc end  -- Add description for Neovim's built-in help
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal({']h', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end, "Next hunk")

      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal({'[h', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end, "Previous hunk")

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, "Stage Hunk")
      map('n', '<leader>hr', gitsigns.reset_hunk, "Reset Hunk")

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, "Stage Hunk (Visual)")

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, "Reset Hunk (Visual)")

      map('n', '<leader>hS', gitsigns.stage_buffer, "Stage Buffer")
      map('n', '<leader>hR', gitsigns.reset_buffer, "Reset Buffer")
      map('n', '<leader>hp', gitsigns.preview_hunk, "Preview Hunk")
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, "Inline Hunk Diff")

      map('n', '<leader>hb', function()
        gitsigns.blame_line({ full = true })
      end, "Blame Line")

      map('n', '<leader>hd', gitsigns.diffthis, "Diff against Index")

      map('n', '<leader>hD', function()
        gitsigns.diffthis('~')
      end, "Diff against Last Commit")

      map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, "Quickfix: All Hunks")
      map('n', '<leader>hq', gitsigns.setqflist, "Quickfix: Current File")

      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, "Toggle Blame")
      map('n', '<leader>td', gitsigns.toggle_deleted, "Toggle Deleted Lines")
      map('n', '<leader>tw', gitsigns.toggle_word_diff, "Toggle Word Diff")

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', "Select Hunk")
    end
  }
}
