local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
--opt.expandtab = true 			--spaces over tabs
opt.smartindent = true
opt.termguicolors = true
opt.hlsearch = false
opt.incsearch = true
opt.backup = false
opt.undofile = true
opt.scrolloff = 10
opt.swapfile = false
opt.fillchars:append({eob = " "})
opt.guicursor = "n-v-c-i-sm:block-blinkon500-blinkoff500-blinkwait500"

