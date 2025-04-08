return {
  { 'rafamadriz/friendly-snippets' },
  {
    "chrisgrieser/nvim-scissors",
    keys = {
      { "<leader>na", function() require("scissors").addNewSnippet() end, mode = { 'n', 'x' }, desc = "Snippets: add" },
      { "<leader>ne", function() require("scissors").editSnippet() end, desc = "Snippets: edit" }
    }
  }
}
