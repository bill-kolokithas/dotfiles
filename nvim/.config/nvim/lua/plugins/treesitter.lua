return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "diff",
        "ruby",
        "python",
        "javascript",
        "sql"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {}
      },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      multiline_threshold = 5,
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    main = 'nvim-treesitter.configs',
    opts = {
      textobjects = {
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          }
        }
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    main = 'nvim-treesitter.configs',
    opts = {
      refactor = {
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "gsr",
          }
        }
      }
    }
  }
}
