vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = false
vim.o.autoindent = false
vim.o.smartindent = false
vim.o.background = "light"
vim.o.foldenable = true
vim.g.autoformat = false
vim.g.tex_flavor = "latex"
vim.g.termguicolors = true
vim.opt.winbar = "global"
vim.opt.laststatus = 3
vim.o.clipboard = "unnamedplus"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.cmd([[colorscheme edge]])
vim.cmd("hi Twilight ctermfg=8")



-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.opt_local.formatoptions:remove({ "r", "o" })
-- 	end,
-- })
