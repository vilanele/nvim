vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = false
vim.o.autoindent = false
vim.o.smartindent = false
vim.o.background = "dark"
vim.o.foldenable = true
vim.g.autoformat = false
vim.g.termguicolors = true
vim.opt.winbar = "global"
vim.opt.laststatus = 3
vim.o.clipboard = "unnamedplus"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.cmd([[colorscheme edge]])
vim.cmd("hi Twilight ctermfg=8")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- Buffer splits
vim.keymap.set("n", "sh", ":leftabove vsplit<cr>")
vim.keymap.set("n", "sl", ":rightbelow vsplit<cr>")
vim.keymap.set("n", "sj", ":rightbelow split<cr>")
vim.keymap.set("n", "sk", ":leftabove split<cr>")
vim.keymap.set("n", "s<Left>", ":leftabove vsplit<cr>")
vim.keymap.set("n", "s<Right>", ":rightbelow vsplit<cr>")
vim.keymap.set("n", "s<Down>", ":rightbelow split<cr>")
vim.keymap.set("n", "s<Up>", ":leftabove split<cr>")
-- Terminal splits
vim.keymap.set("n", "th", ":leftabove vsplit | term<cr>")
vim.keymap.set("n", "tl", ":rightbelow vsplit | term<cr>")
vim.keymap.set("n", "tj", ":rightbelow split | term<cr>")
vim.keymap.set("n", "tk", ":leftabove split | term<cr>")
vim.keymap.set("n", "t<Left>", ":leftabove vsplit | term<cr>")
vim.keymap.set("n", "t<Right>", ":rightbelow vsplit | term<cr>")
vim.keymap.set("n", "t<Down>", ":rightbelow split | term<cr>")
vim.keymap.set("n", "t<Up>", ":leftabove split | term<cr>")

-- vim.keymap.set("i", "ii", "<esc>o")

function set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.cmd('autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"')
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> <Esc>/---End---<CR><Esc>kzzO<CR>]])
vim.cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])
vim.cmd([[autocmd BufRead,BufNewFile *.sage set filetype=python]])
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.opt_local.formatoptions:remove({ "r", "o" })
-- 	end,
-- })

-- vim.keymap.set("o", "il", ":<c-u>normal! $v^<cr>", { noremap = true, silent = true })
-- vim.keymap.set("x", "il", ":<c-u>normal! $v^<cr>", { noremap = true, silent = true })
-- vim.keymap.set("x", "al", ":<c-u>normal! $v0<cr>", { noremap = true, silent = true })
