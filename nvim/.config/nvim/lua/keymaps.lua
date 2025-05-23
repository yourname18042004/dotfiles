local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

keymap.set('n', 'dw', 'vb"_d')

--select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

--new table
keymap.set('n', 'te', ':tabedit<return>', { silent = true })
keymap.set('n', 'ss', ':split<return><c-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<return><c-w>w', { silent = true })

-- move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')

keymap.set('i', '<C-h>', '<left>')
keymap.set('i', '<C-k>', '<up>')
keymap.set('i', '<C-j>', '<down>')
keymap.set('i', '<C-l>', '<right>')
-- Vô hiệu hóa phím mũi tên trong Normal mode
vim.api.nvim_set_keymap("n", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Vô hiệu hóa phím mũi tên trong Insert mode
vim.api.nvim_set_keymap("i", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Vô hiệu hóa phím mũi tên trong Visual mode
vim.api.nvim_set_keymap("v", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Right>", "<NOP>", { noremap = true, silent = true })
--
--keymap.set( 'n', "<Tab>", "gt" )
--keymap.set( 'n', "<S-Tab>", "gT" )

--move
keymap.set('n', "<C-S-k>", "kzz")
keymap.set('n', "<C-S-j>", "jzz")
--resize
keymap.set('n', 'rsh', '<C-w><')
keymap.set('n', 'rsl', '<C-w>>')
keymap.set('n', 'rsk', '<C-w>+')
keymap.set('n', 'rsj', '<C-w>-')

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
  end,
})

-- Show error 
keymap.set('n', '<leader>e', vim.diagnostic.open_float)
keymap.set('n', '<leader>ne', vim.diagnostic.goto_next)
keymap.set('n', '<leader>pe', vim.diagnostic.goto_prev)

--zen mode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR> & Twilight", { noremap = true, silent = true })

-- move select 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
