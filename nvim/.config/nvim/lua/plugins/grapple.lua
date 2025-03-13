return {
  'cbochs/grapple.nvim',
  cmd = 'Grapple',
  opts = {
    scope = 'file',
    scopes = {
      {
        name = "file",
        desc = "Current file",
        cache = { event = "BufEnter" },
        resolver = function()
          return vim.fn.expand("%:p")
        end
      }
    }
  }
}
