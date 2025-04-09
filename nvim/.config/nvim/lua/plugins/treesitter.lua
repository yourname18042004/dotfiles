return{
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
                "json",
                "c", 
                "cpp", 
                "c_sharp", 
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
