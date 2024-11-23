require("lspconfig").volar.setup({
	-- capabilities = capabilities,
	init_options = {
		typescript = {
			tsdk = "/home/vilanele/.npm-global/lib/node_modules/typescript/lib",
			--       -- Alternative location if installed as root:
			--       -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
		},
	},
	filetypes = { "vue" },
})
