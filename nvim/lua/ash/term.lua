local buf = nil 
local map = vim.keymap.set
local opts = {noremap = true, silent = true}

map('n', '<leader>t', function()
	if buf and vim.api.nvim_buf_is_valid(buf) then
		vim.cmd.new()
		vim.api.nvim_win_set_buf(0, buf)
	else
		vim.cmd.new()
		vim.cmd.term()
		buf = vim.api.nvim_get_current_buf()
	end

	vim.cmd.wincmd('J')
	vim.api.nvim_win_set_height(0,7)
	vim.cmd('startinsert')
end)

--map('t', '<leader>t', '<C-\\><C-n>:q<CR>', opts)
map('t', '<esc>', '<C-\\><C-n>', opts)
