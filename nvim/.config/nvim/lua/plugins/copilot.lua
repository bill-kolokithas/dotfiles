return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = true
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    cmd = "CopilotChatToggle",
    config = true
  }
}
