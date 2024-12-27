return {
    'akinsho/toggleterm.nvim',
    config = function ()
        local terminal = require("toggleterm")
        terminal.setup({
            size = 13,
            open_mapping = [[<c-\>]],
            chader_filetypes = {},
            shader_terminals = true,
            shading_factor = '1',
            start_in_insert = true,
            persist_size = true,
            direction = 'float',
            auto_scroll = true,
            float_opts = {
                border = 'curved',
                title_pos = 'center' 
            }
        })
    end
}
