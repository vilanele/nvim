return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",
						["ai"] = "@assignment.inner",
						["ao"] = "@assignment.outer",
						["ls"] = "@assignment.lhs",
						["rs"] = "@assignment.rhs",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["fn"] = "@function.outer",
						["cn"] = "@parameter.inner",
					},
					goto_next_end = {
						["ffn"] = "@function.inner",
					},
					goto_previous_start = {
						["fp"] = "@function.outer",
						["cp"] = "@parameter.inner",
					},
					goto_previous_end = {
						["ffp"] = "@function.inner",
					},
				},
			},
		})
	end,
}
