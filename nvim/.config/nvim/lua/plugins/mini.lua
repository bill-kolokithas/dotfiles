return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup()
    require('mini.align').setup()
    require('mini.splitjoin').setup()
  end
}
