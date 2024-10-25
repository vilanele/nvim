-- plugins/quarto.lua
return {

	"quarto-dev/quarto-nvim",
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = "markdown",
	config = function()
		local quarto = require("quarto")
		quarto.setup({
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
			lspFeatures = {
				enabled = true,
				chunks = "all",
				languages = { "python", },
				diagnostics = {
					enabled = true,
					-- triggers = { "InsertLeave", "BufWritePost", "TextChange },
				},
				completion = {
					enabled = true,
				},
			},
		})
	end
}
