-- Lua
return {
	"folke/twilight.nvim",
	config = function()
		vim.keymap.set("n", ";t", ":Twilight<cr>")
		require("twilight").setup({
			dimming = {
				alpha = 0.9,
				-- color = { "Normal", "#ffffff" },
				-- term_bg = "#000000",
				inactive = false,
			},
			context = 5,
			treesitter = true,
			expand = {
				-- "function_definition",
				-- "assignment",
				-- "function_call",
				"rule_set",
				-- "declaration",
				-- "function_declaration",
			},
		})
	end,
}
