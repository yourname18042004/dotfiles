return {
  {
    'stevearc/dressing.nvim',
    opts = {},
  }, 
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function ()
      require("flutter-tools").setup ({
        config = true;
      }) 
    end,
  }
}
