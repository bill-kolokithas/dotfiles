return {
  'jake-stewart/multicursor.nvim',
  config = function()
    local mc = require('multicursor-nvim')
    mc.setup()

    mc.addKeymapLayer(function(layerSet)
      layerSet({"n", "x"}, "<left>", mc.prevCursor)
      layerSet({"n", "x"}, "<right>", mc.nextCursor)
      layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)
      layerSet({"n", "x"}, "<leader>n", function() mc.matchSkipCursor(1) end)
      layerSet({"n", "x"}, "<leader>t", function() mc.transposeCursors(1) end)
      layerSet("n", "<esc>", function() mc.clearCursors() end)
    end)

    mc.onSafeState(function()
      if mc.hasCursors() then
        vim.cmd('Hardtime disable')
      else
        vim.cmd('Hardtime enable')
      end
    end)

    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn"})
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
  end,
  keys = {
    -- Add cursors vertically
    { "<C-up>", function() require('multicursor-nvim').lineAddCursor(-1) end, mode = {"n", "x"} },
    { "<C-down>", function() require('multicursor-nvim').lineAddCursor(1) end, mode = {"n", "x"} },
    { "<leader><up>", function() require('multicursor-nvim').lineSkipCursor(-1) end, mode = {"n", "x"} },
    { "<leader><down>", function() require('multicursor-nvim').lineSkipCursor(1) end, mode = {"n", "x"} },

    -- Add or skip adding a new cursor by matching word/selection
    { "<C-n>", function() require('multicursor-nvim').matchAddCursor(1) end, mode = {"n", "x"} },

    -- Add and remove cursors with control + left click.
    { "<c-leftmouse>", function() require('multicursor-nvim').handleMouse() end },
    { "<c-leftdrag>", function() require('multicursor-nvim').handleMouseDrag() end },
    { "<c-leftrelease>", function() require('multicursor-nvim').handleMouseRelease() end }
  }
}
