return {
  "folke/flash.nvim",
  lazy = false,
  keys = {
    { "<Leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Jump" },
    { "<Leader>J", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "treesitter" },
  },
  opts = {
    search = {
      multi_window = false
    },
    modes = {
      search = {
        enabled = true,
      },
      char = { enabled = true }
    }
  }
}
