return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  config = function()
    require('oil').setup({
      skip_confirm_for_simple_edits = true
    })
  end
}
