return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  config = function()
    require('oil').setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["<C-s>"] = {}
      }
    })
  end
}
