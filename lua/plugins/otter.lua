return {
	'jmbuhr/otter.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	config = function()
		require('otter').setup {
			lsp = {
				diagnostic_updaye_events = { "BufWritePost", "InsertLeave", "TextChanged" }
			}
		}
	end,
	opts = {},
}
