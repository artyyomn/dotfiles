local map = vim.keymap.set
local opts = {noremap = true, silent = true}

vim.g.mapleader = " "

--basic stuffs
map("n", "<Space>", "<Nop>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>e", ":Lexplore<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>Q", ":q!<CR>", opts)

--autoclosing brackets
map("i", "(", "()<left>", opts)
map("i", "[", "[]<left>", opts)
map("i", "{", "{}<left>", opts)
map("i", "<", "<><left>", opts)
map("i", "'", "''<left>", opts)
map("i", '"', '""<left>', opts)

--tab movements
map("n", "<A-q>", ":tabp<CR>", opts)
map("n", "<A-w>", ":tabn<CR>", opts)
map("n", "<A-n>", ":tabnew<CR>", opts)
map("n", "<A-f>", ":tabfirst<CR>", opts)
map("n", "<A-l>", ":tablast<CR>", opts)

--telescope bindings
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>g", ":Telescope live_grep<CR>", opts)
map("n", "<leader>b", ":Telescope buffers<CR>", opts)

map('n', '<leader>g', vim.lsp.buf.definition, opts)
map('n', '<leader>b', '<C-o>', opts)
map('n', '<leader>d', vim.diagnostic.setloclist, opts)

--easy window movements
map('n', '<A-h>', '<C-w>h', opts)
map('n', '<A-j>', '<C-w>j', opts)
map('n', '<A-k>', '<C-w>k', opts)
map('n', '<A-l>', '<C-w>l', opts)

