vim.lsp.config.lua = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library"
        },
        checkThirdParty = false
      },
      telemetry = {
        enable = false
      }
    }
  }
}

vim.lsp.config.ruby = {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile', '.git' }
}

vim.lsp.enable({ 'lua', 'ruby' })
