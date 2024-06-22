return {
	"LukasPietzschmann/telescope-tabs",
	config = function()
		require("telescope").load_extension("telescope-tabs")
		require("telescope-tabs").setup({
			vim.keymap.set("n", ",t", ":Telescope telescope-tabs list_tabs<cr>"),
		})
	end,
	dependencies = { "nvim-telescope/telescope.nvim" },
}
