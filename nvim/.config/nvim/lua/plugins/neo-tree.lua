return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",     
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-e>', ':Neotree filesystem reveal right<CR>', {})
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- Hiển thị các tệp ẩn
          hide_dotfiles = false, -- Không ẩn tệp bắt đầu bằng dấu chấm
          hide_gitignored = false, -- Không ẩn tệp bị Git ignore
        }
      }
    })
  end
} 
