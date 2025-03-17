return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.ai').setup()
    require('mini.align').setup()
    require('mini.splitjoin').setup()
  end
}
