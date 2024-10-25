return {

	"neovim/nvim-lspconfig",
	-- "folke/neodev.nvim",
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		-- local configs = require("lspconfig.configs")
		-- if not configs.systemd_ls then
		-- 	configs.systemd_ls = {
		-- 		default_config = {
		-- 			cmd = { "systemd-language-server" },
		-- 			filetypes = { "systemd" },
		-- 			root_dir = function()
		-- 				return nil
		-- 			end,
		-- 			single_file_support = true,
		-- 			settings = {},
		-- 		},
		-- 		docs = {
		-- 			description = [[]],
		-- 		},
		-- 	}
		-- end
		--
		-- require("lspconfig").systemd_ls.setup({})
		-- require("neodev").setup({
		-- 	-- add any options here, or leave empty to use the default settings
		-- })
		vim.keymap.set("n", ",e", "<cmd>lua vim.diagnostic.goto_next({float = true})<cr>")
		vim.keymap.set("n", ",,e", "<cmd>lua vim.diagnostic.goto_prev({float =  true})<cr>")
		vim.diagnostic.config({ virtual_text = false, float = { border = "rounded" } })

		require 'lspconfig'.vimls.setup {}
		require 'lspconfig'.prolog_ls.setup {}

		-- PYTHON
		require("lspconfig").pyright.setup({
			completion = false,
		})
		require('lspconfig').kotlin_language_server.setup({})
		-- require("lspconfig").jedi_language_server.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = {
		-- 		"python",
		-- 		"cython",
		-- 		"pyrex",
		-- 	},
		-- })

		-- LATEX
		require("lspconfig").texlab.setup({
			capabilities = capabilities,
		})
		require 'lspconfig'.clangd.setup {}

		-- LUA
		require("lspconfig").lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					}
				}
			}
		})

		-- TSSERVER
		require("lspconfig").tsserver.setup({
			capabilities = capabilities,
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
						location = "/home/vilanele/.npm/lib/node_modules/@vue/typescript-plugin",
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
		-- require("lspconfig").volar.setup({
		-- 	capabilities = capabilities,
		-- 	init_options = {
		-- 		typescript = {
		-- 			tsdk = "/home/vilanele/.npm/lib/node_modules/typescript/lib",
		-- 			--       -- Alternative location if installed as root:
		-- 			--       -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
		-- 		},
		-- 	},
		-- 	--   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
		-- })
		-- lspconfig.tsserver.setup {}
		-- require("lspconfig").volar.setup({})
		-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		-- 	init_options = {
		-- 		vue = {
		-- 			hybridMode = false,
		-- 		},
		-- 	},
		-- })
		-- require 'lspconfig'.volar.setup {}
		--   -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
		-- }
		--
		-- CSS
		require("lspconfig").cssls.setup({
			capabilities = capabilities,
		})

		-- HTML
		require("lspconfig").html.setup({
			capabilities = capabilities,
		})

		-- BASH
		require("lspconfig").bashls.setup({
			filetypes = { "sh", "bash", "zsh" },
		})
		require('lspconfig').julials.setup({})


		-- JSON
		require("lspconfig").jsonls.setup({

			capabilities = capabilities,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas({
						select = {
							"Pyright",
						},
					}),
					validate = { enable = true },
				},
			},
		})
		--Enable (broadcasting) snippet capability for completion

		-- EMMET
		require("lspconfig").emmet_language_server.setup({
			capabilities = capa,
			filetypes = {
				"css",
				"html",
				"typescriptreact",
				"javascriptreact"
			}, -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
			-- **Note:** only the options listed in the table are supported.
			init_options = {
				---@type table<string, string>
				includeLanguages = {},
				--- @type string[]
				excludeLanguages = {},
				--- @type string[]
				extensionsPath = {},
				--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
				preferences = {},
				--- @type boolean Defaults to `true`
				showAbbreviationSuggestions = true,
				--- @type "always" | "never" Defaults to `"always"`
				showExpandedAbbreviation = "always",
				--- @type boolean Defaults to `false`
				showSuggestionsAsSnippets = false,
				--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
				syntaxProfiles = {},
				--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
				variables = {},
			},
		})
	end,
}
