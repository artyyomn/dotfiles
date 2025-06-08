-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Lazy.nvim not found, cloning...")
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
	  vim.api.nvim_echo({
		  { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
		  { out, "WarningMsg" },
		  { "\nPress any key to exit..." },
	  }, true, {})
	  vim.fn.getchar()
	  os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'rebelot/kanagawa.nvim',
		name = "kanagawa",
		config = function()
			--vim.cmd("colorscheme kanagawa-dragon")
		end
	},

	{
		"nvim-telescope/telescope.nvim", 
		dependencies = { "nvim-lua/plenary.nvim" }
	},

 	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {'c', 'javascript', 'typescript'},
				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 1000 * 1024 -- 1000 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},

	{
		'neovim/nvim-lspconfig',
		dependencies = { 'saghen/blink.cmp' },
		config = function()
			capabilities = require('blink.cmp').get_lsp_capabilities(capabilities),
			require('lspconfig').clangd.setup {capabilities = capabilities}
			require('lspconfig').gopls.setup {capabilities = capabilities}
		end,
	},

	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		opts = {
			keymap = { preset = 'super-tab' },

			appearance = {
				nerd_font_variant = 'mono'
			},

			completion = { documentation = { auto_show = true} },
		},

	},
})
