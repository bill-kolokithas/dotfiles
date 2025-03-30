return {
  "ibhagwan/fzf-lua",
  dependencies = {
    {
      "junegunn/fzf",
      version = '*',
      build = ":call fzf#install()"
    }
  },
  cmd = 'FzfLua',
  opts = {
    oldfiles = {
      include_current_session = true,
    },
    grep = {
      hidden = true
    }
  },
  keys = {
    { "<Leader>f", "<cmd>FzfLua files<CR>", desc = "Find files" },
    { "<Leader>b", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
    { "<Leader>e", "<cmd>FzfLua live_grep<CR>", desc = "live grep" },
    { "<Leader>s", "<cmd>FzfLua grep_cword<CR>", desc = "grep word" },
    { "<Leader>S", "<cmd>FzfLua grep_cWORD<CR>", desc = "grep WORD" },
    { "<Leader>s", "<cmd>FzfLua grep_visual<CR>", mode = { "x" }, desc = "grep WORD" },
    { "<Leader>t", "<cmd>FzfLua btags<CR>", desc = "buffer tags" },
    { "<Leader>T", "<cmd>FzfLua tags<CR>", desc = "project tags" },
    { "<Leader>gh", "<cmd>FzfLua git_bcommits<CR>", desc = "git file history" },
    { "<Leader>gs", "<cmd>FzfLua git_status<CR>", desc = "git status" },
    { "<Leader>r", "<cmd>FzfLua resume<CR>", desc = "FzfLua resume" },
    { "<Leader>D", "<cmd>FzfLua diagnostics_document<CR>", desc = "diagnostics" },
    { "<Leader>o", "<cmd>FzfLua oldfiles<CR>", desc = "recent files" },
    { "<Leader>H", "<cmd>FzfLua helptags<CR>", desc = "Neovim help" },
  }
}
