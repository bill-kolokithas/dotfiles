return {
  "yorickpeterse/nvim-window",
  opts = {
    normal_hl = 'CurSearch',
    hint_hl = '',
    border = ''
  },
  keys = {
    { "<C-W>a", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  }
}
