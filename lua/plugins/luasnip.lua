M = {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		require("luasnip.loaders.from_lua").load({ paths = { "/home/vilanele/.config/nvim/snippets" } })
		-- vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}
		ls.setup({
			enable_autosnippets = true,
			ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,

			histoy = true,
			updateevents = "TextChanged, TextChangedI",
			-- enable_autosnippets = true,
			store_selection_keys = "<Tab>",
			ext_opts = {
				[require("luasnip.util.types").choiceNode] = {
					active = {
						virt_text = { { "o", "GruvBoxOrange" } },
					},
				},
			},
		})
		require("luasnip/loaders/from_vscode").lazy_load()
		vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
		vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
		vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
		vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
		-- require('luasnip.loaders.from_snipmate').lazy_load({paths = "/home/vilanele/.config/nvim/snippets"})
	end,
}

return M
