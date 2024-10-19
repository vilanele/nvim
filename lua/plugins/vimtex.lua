return {
	"lervag/vimtex",
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_imaps_leader = ",,"
		vim.g.vimtex_fold_enabled = 1
		vim.cmd(
			"let g:vimtex_toc_config = { 'name' : 'TOC' , 'layer_status' : { 'content':1, 'label':0, 'todo':0, 'include':0 }, 'show_help':0 }"
		)
		vim.keymap.set("n", ",,t", ":VimtexTocToggle<cr>")
		vim.keymap.set("n", ",,l", ":VimtexCompile<cr>")
		vim.keymap.set("n", ",,z", ":VimtexView<cr>")
		vim.keymap.set("n", ",,q", ":VimtexErrors<cr>")
	end,
}
