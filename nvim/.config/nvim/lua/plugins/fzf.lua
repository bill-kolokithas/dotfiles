return {
  {
    "junegunn/fzf",
    dir = "~/.fzf",
    build = "./install --all"
  },
  {
    "ibhagwan/fzf-lua",
    cmd = 'FzfLua',
    keys = {
      { "<Leader>f", "<cmd>FzfLua files<CR>", desc = "Find files" },
      { "<Leader>b", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
      { "<Leader>g", "<cmd>FzfLua grep<CR>", desc = "grep all" },
      { "<Leader>s", "<cmd>FzfLua grep_cword<CR>", desc = "grep word" },
      { "<Leader>S", "<cmd>FzfLua grep_cWORD<CR>", desc = "grep WORD" },
      { "<Leader>v", "<cmd>FzfLua grep_visual<CR>", mode = { "x" }, desc = "grep WORD" },
      { "<Leader>t", "<cmd>FzfLua btags<CR>", desc = "buffer tags" },
      { "<Leader>T", "<cmd>FzfLua tags<CR>", desc = "project tags" },
      { "<Leader>H", "<cmd>FzfLua git_bcommits<CR>", desc = "git file history" },
      { "<Leader>r", "<cmd>FzfLua registers<CR>", desc = "registers" },
      { "<Leader>D", "<cmd>FzfLua diagnostics_document<CR>", desc = "diagnostics" },
    }
  }
}
