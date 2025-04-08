return {
  "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim" },
   opts = {
    max_count = 10,
    disable_mouse = false,
    disabled_keys = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<Left>"] = {},
      ["<Right>"] = {}
    },
    restricted_keys = {
      ["w"] = { "n", "x" },
      ["b"] = { "n", "x" },
      ["W"] = { "n", "x" },
      ["B"] = { "n", "x" },
      ["e"] = { "n", "x" },
      ["E"] = { "n", "x" },
    }
  },
}
