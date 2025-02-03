return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    shortcut_type = 'number',
    config = {
      project = { enable = false },
      shortcut = {
        {
          icon = "  ",
          desc = "Restore Session",
          key = "r",
          action = function() require("persistence").load() end
        },
        {
          icon = "  ",
          desc = "Lazy Sync",
          key = "s",
          action = function() vim.cmd('Lazy sync') end
        },
        {
          icon = "  ",
          desc = "Open Terminal",
          key = "t",
          action = function() vim.cmd('terminal') end,
        },
        {
          icon = "  ",
          desc = "New File",
          key = "n",
          action = function() vim.cmd('enew') end,
        },
        {
          icon = "  ",
          desc = "Open Config",
          key = "c",
          action = function() vim.cmd('e $MYVIMRC') end,
        }
      }
    }
  }
}
