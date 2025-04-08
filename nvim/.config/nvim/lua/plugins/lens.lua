return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require("scrollbar.handlers.search").setup()
  end,
  keys = {
    {
      '*',
      function()
        vim.cmd('normal! *')
        require('hlslens').start()
      end
    }
  }
}
