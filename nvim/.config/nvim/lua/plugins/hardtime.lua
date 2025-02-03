return {
  "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim" },
   opts = {
    max_count = 5,
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
