return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			indent = {
				enable = true,
				disable = { "html", "tex" },
			},
			matchup = {
				enable = true, -- mandatory, false will disable the whole extension
				disable = {}, -- optional, list of language that will be disabled
				disable_virtual_text = true,
				-- [options]
			},
			textobjects = {
				highlight = {
					enable = true,
					ensure_installed = { "vue", "python", "lua", "html" },
				},
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
						["aa"] = "@assignment.outer",
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
