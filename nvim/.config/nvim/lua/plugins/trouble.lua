return {
  "folke/trouble.nvim",
  config = true,
  cmd = "Trouble",
  keys = {
    { "<leader>d", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" }
  }
}
