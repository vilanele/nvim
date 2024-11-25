return {

	"neovim/nvim-lspconfig",
	-- "folke/neodev.nvim",
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		local configs = require("lspconfig.configs")
		if not configs.systemd_ls then
			configs.systemd_ls = {
				default_config = {
					cmd = { "systemd-language-server" },
					filetypes = { "systemd" },
					root_dir = function()
						return nil
					end,
					single_file_support = true,
					settings = {},
				},
				docs = {
					description = [[]],
				},
			}
		end

		-- 	-- add any options here, or leave empty to use the default settings
		-- })
		vim.keymap.set("n", ",e", "<cmd>lua vim.diagnostic.goto_next({float = true})<cr>")
		vim.keymap.set("n", ",,e", "<cmd>lua vim.diagnostic.goto_prev({float =  true})<cr>")
		vim.diagnostic.config({ virtual_text = false, float = { border = "rounded" } })

		-- Systemd
		require("plugins.lsp.systemd_ls")
		-- Python
		-- require("plugins.lsp.pylsp")
		require("plugins.lsp.pyright")
		require("plugins.lsp.ruff")

		-- Lua
		require("plugins.lsp.lua_ls")
		-- Typescript
		require("plugins.lsp.ts_ls")
		-- Bash
		require("plugins.lsp.bashls")
		-- CSS
		require("plugins.lsp.cssls")
		-- HTML
		require("plugins.lsp.html")
		-- emmet
		require("plugins.lsp.emmet_ls")
		-- VIM
		require("plugins.lsp.vimls")
		-- C/C++/C#
		require("plugins.lsp.clangd")
		-- vue
		require("plugins.lsp.volar")
		-- Prolog
		require("plugins.lsp.prolog_ls")
		-- Lates
		require("plugins.lsp.texlab")
	end,
}
