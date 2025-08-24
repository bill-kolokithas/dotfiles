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
          score_offset = 10,
          min_keyword_length = 2,
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
      menu = {
        auto_show = true,
        draw = {
          treesitter = { 'lsp' }
        }
      },
      documentation = { auto_show = true },
      list = {
        selection = {
          auto_insert = false,
          preselect = true
        }
      },
    }
  }
}
