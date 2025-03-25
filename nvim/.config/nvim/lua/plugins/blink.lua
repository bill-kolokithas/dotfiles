return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    keymap = {
      preset = 'enter',
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Del>'] = { 'hide', 'fallback' },
    },
    cmdline = {
      enabled = true,
      keymap = { preset = 'inherit' },
      completion = {
        menu = { auto_show = true },
        list = {
          selection = {
            auto_insert = false,
            preselect = false
          }
        }
      }
    },
    completion = {
      list = {
        selection = {
          auto_insert = false,
          preselect = true
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 1000
      }
    },
    signature = {
      enabled = true
    }
  }
}
