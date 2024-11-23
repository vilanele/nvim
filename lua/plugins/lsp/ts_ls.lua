require("lspconfig").ts_ls.setup({
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
	init_options = {
		-- preferences = {
		-- 	includeCompletionsWithSnippetText = true,
		-- 	includeCompletionsForImportStatements = true,
		-- },
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/home/vilanele/.npm-global/lib/node_modules/@vue/typescript-plugin",
				languages = { "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"typescriptreact",
		"typescript",
		"vue",
	},
})
