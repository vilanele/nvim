return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		theme = "gruvbox_light",
	},
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = false,
				disabled_filetypes = { "neo-tree", }
			},
			-- sections = {
			-- 	lualine_a = { "filename" },
			-- 	lualine_b = { "mode" },
			-- 	lualine_c = { "location" },
			-- },
			winbar = {
				lualine_a = { "filename" },
				lualine_b = { "mode" },
				lualine_c = { "location" },
			},
			inactive_winbar = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
			},
		})
	end,
}
