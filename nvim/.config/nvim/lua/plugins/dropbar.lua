return {
  'Bekaboo/dropbar.nvim',
  opts = {
    sources = {
      path = {
        relative_to = function(buf, _)
          -- Find the .git directory relative to the current buffer
          local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")

          -- If found, remove the "/.git" part to get the project root
          if git_dir ~= "" then
            return vim.fn.fnamemodify(git_dir, ":h")
          end

          -- Fall back to buffer's working directory if no .git directory is found
          return vim.fn.getcwd(buf)
        end
      }
    },
    bar = {
      sources = function()
        local sources = require('dropbar.sources')
        local utils = require('dropbar.utils')
        return {
          utils.source.fallback({
            sources.lsp,
            sources.path,
          })
        }
      end
    }
  }
}
