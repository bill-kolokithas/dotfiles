return {
  { "junegunn/fzf" },
  {
    "ibhagwan/fzf-lua",
    cmd = 'FzfLua',
    keys = {
      { "<Leader>f", "<cmd>FzfLua files<CR>", desc = "Find files" },
      { "<Leader>b", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
      { "<Leader>e", "<cmd>FzfLua grep<CR>", desc = "grep all" },
      { "<Leader>s", "<cmd>FzfLua grep_cword<CR>", desc = "grep word" },
      { "<Leader>S", "<cmd>FzfLua grep_cWORD<CR>", desc = "grep WORD" },
      { "<Leader>v", "<cmd>FzfLua grep_visual<CR>", mode = { "x" }, desc = "grep WORD" },
      { "<Leader>t", "<cmd>FzfLua btags<CR>", desc = "buffer tags" },
      { "<Leader>T", "<cmd>FzfLua tags<CR>", desc = "project tags" },
      { "<Leader>gh", "<cmd>FzfLua git_bcommits<CR>", desc = "git file history" },
      { "<Leader>gs", "<cmd>FzfLua git_status<CR>", desc = "git status" },
      { "<Leader>r", "<cmd>FzfLua registers<CR>", desc = "registers" },
      { "<Leader>D", "<cmd>FzfLua diagnostics_document<CR>", desc = "diagnostics" },
      { "<Leader>m", "<cmd>FzfLua marks<CR>", desc = "marks" },
      { "<Leader>o", "<cmd>FzfLua oldfiles<CR>", desc = "recent files" },
      { "<Leader>H", "<cmd>FzfLua helptags<CR>", desc = "Neovim help" },
    }
  }
}
