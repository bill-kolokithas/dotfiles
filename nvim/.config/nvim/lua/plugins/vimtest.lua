return {
  "vim-test/vim-test",
  config = function()
    vim.g["test#strategy"] = "neovim_sticky"
    vim.g["test#neovim#term_position"] = "vert"

    vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "Test Nearest" })
    vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Test File" })
    vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Test Last" })
  end
}
