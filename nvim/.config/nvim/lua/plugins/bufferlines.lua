return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
        { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
        options = {
            mode = "tabs",
            show_buffer_close_icons = false,
            show_close_icon = false,
        }
    },
    config = function()
        require("bufferline").setup({

        })
    end    
}
