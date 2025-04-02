return {
  "folke/snacks.nvim",
  event = 'VeryLazy',
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
    { '<leader>c', function() require('snacks').scratch() end, desc = 'Toggle Scratch Buffer' },
    { '<leader>go', function() require('snacks').gitbrowse() end, { desc = 'Git open file' } },
    { '<leader>N', function() require('snacks').notifier.show_history() end, { desc = 'Notify history' } }
  }
}
