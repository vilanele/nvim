return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require('neo-tree').setup({
			sources = {
				"filesystem",
				"buffers",
				"document_symbols",
				"git_status"
			},
			source_selector = {
				winbar = true,
				statusline = false,
				sources = { -- table
					{
						source = "filesystem", -- string
						display_name = " 󰉓 Files " -- string | nil
					},
					{
						source = "buffers", -- string
						display_name = " 󰈚 Buffers " -- string | nil
					},
				},
			},
		})
	end
}
