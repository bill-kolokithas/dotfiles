return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").solargraph.setup({})
    require("lspconfig").lua_ls.setup({
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
