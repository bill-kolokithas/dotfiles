vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd("startinsert")
    end
  end
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff", bg = "#ff0000", bold = true })
  end
})

-- Shift numbered registers up (1 becomes 2, etc.)
local function yank_shift()
  for i = 9, 1, -1 do
    vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
  end
end

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local event = vim.v.event
    if event.operator == "y" then
      yank_shift()
    end
  end
})
