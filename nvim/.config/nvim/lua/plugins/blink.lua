return {
  'saghen/blink.cmp',
  dependencies = { "fang2hou/blink-copilot" },
  version = '*',
  opts = {
    sources = {
      default = { 'lsp', 'buffer', 'snippets', 'path', 'copilot' },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          min_keyword_length = 5,
          async = true,
        }
      }
    },
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<A-Backspace>'] = { 'hide', 'fallback' }
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
