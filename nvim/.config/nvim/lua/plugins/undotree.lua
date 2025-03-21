return {
  "mbbill/undotree",
  cmd = 'UndotreeToggle',
  init = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_SplitWidth = 50
  end
}
