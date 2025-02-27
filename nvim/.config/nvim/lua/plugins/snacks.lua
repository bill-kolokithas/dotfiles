return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    indent = {
      indent = {
        only_scope = true,
        only_current = true
      },
      scope = {
        only_current = true
      }
    },
    dim = {
      scope = {
        min_size = 3
      }
    },
    gitbrowse = {},
    notify = {},
    notifier = {
      timeout = 4000,
      width = { min = 20 }
    },
    scroll = {},
    input = {},
    scratch = {}
  },
  keys = {
    { "<leader>c", function() require('snacks').scratch() end, desc = "Toggle Scratch Buffer" }
  }
}
