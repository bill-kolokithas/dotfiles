return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    require("lspconfig").ruby_lsp.setup({
      capabilities = capabilities
    })

    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT', -- For Neovim
          },
          diagnostics = {
            globals = { 'vim' }, -- Prevent warnings about `vim` being undefined
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME, -- Recognize Neovim runtime files
              "${3rd}/luv/library"
            },
            checkThirdParty = false, -- Avoid third-party warnings
          },
          telemetry = {
            enable = false, -- Disable telemetry
          }
        }
      }
    })
  end
}
