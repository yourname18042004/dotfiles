return{
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
                "lua", 
                "javascript",
                "typescript",
                "http",
                "css",
                "json",
                "c", 
                "cpp", 
                "c_sharp", 
                "sql",
                "dart",
      },
      highlight = { enable = true },
      indent = { enable = true },
      filetype = {
        dart = {
          function()
            return {
              exe = "dart",
              args = { "format", "--fix", "-" },
              stdin = true
            }
          end
        }
      }
    })
  end 
}
