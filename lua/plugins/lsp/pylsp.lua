require("lspconfig").pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				rope_autoimport = {
					enabled = true,
					completions = {
						enabled = true,
					},
					code_actions = {
						enabled = true,
					},
				},
				black = { line_length = 79 },
			},
		},
	},
})
