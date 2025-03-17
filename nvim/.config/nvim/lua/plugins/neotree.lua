return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = 'Neotree',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true
      }
    }
  }
}
