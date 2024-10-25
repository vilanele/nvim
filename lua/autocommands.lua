-- Terminal mode
--
function set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
	callback = function()
		vim.diagnostic.setloclist({ open = false }) -- Update location list and open it
	end
})
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])

-- Solve resize problems
--
vim.cmd('autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"')

-- Insert snippet
vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> <Esc>/---End---<CR><Esc>kzzO<CR>]])

-- Sage are python
vim.cmd([[autocmd BufRead,BufNewFile *.sage set filetype=python]])
