return {
  'Bekaboo/dropbar.nvim',
  opts = {
    sources = {
      path = {
        relative_to = function(buf, _)
          -- Find the .git directory relative to the current buffer
          local ok, path = pcall(vim.fn.expand, "%:p:h")
          if not ok or path == "" then
            return ""
          end

          local git_dir = vim.fn.finddir(".git", path .. ";")

          -- If found, remove the "/.git" part to get the project root
          if git_dir ~= "" then
            return vim.fn.fnamemodify(git_dir, ":h")
          end

          -- Fall back to buffer's working directory if no .git directory is found
          return pcall(vim.fn.getcwd, buf) and vim.fn.getcwd(buf) or ""
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
            sources.path
          })
        }
      end
    }
  }
}
