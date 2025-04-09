return{ 
  "craftzdog/solarized-osaka.nvim",   
  -- "folke/tokyonight.nvim",
  priority = 1000,
  config = function()

    require("solarized-osaka").setup({
      transparent = true,
    })
    vim.cmd.colorscheme "solarized-osaka"
    -- require("tokyonight").setup({
    --   transparent = true,
    -- })
    -- vim.cmd.colorscheme "tokyonight-night"
  end 
}
