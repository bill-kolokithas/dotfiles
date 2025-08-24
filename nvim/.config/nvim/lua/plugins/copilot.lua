return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      copilot_model = "gpt-41-copilot",
      suggestion = { enabled = false },
      panel = { enabled = false }
    }
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" }
    },
    build = "make tiktoken",
    cmd = "CopilotChatToggle",
    opts = {
      model = 'gpt-5'
    }
  }
}
