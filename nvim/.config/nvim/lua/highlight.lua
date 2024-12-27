vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.termguicolors = true

vim.opt.wildoptions = 'pum'

-- Đặt màu sắc của số dòng
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'yellow' }) -- Màu cho số dòng trong terminal
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'red' }) -- Màu cho số dòng của dòng hiện tại

