local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		-- 'SirVer/ultisnips',
		-- 'honza/vim-snippets',
		-- 'quangnguyen30192/cmp-nvim-ultisnips'
	},
}

M.config = function()
	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	local luasnip = require("luasnip")
	local has_words_before = function()
		unpack = unpack or table.unpack
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
				-- vim.snippet.expand(args.body)
			end,
		},
		-- ... Your other configuration ...
		mapping = {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- that way you will only jump inside the snippet region
					-- elseif luasnip.expand_or_jumpable() then
					--   luasnip.expand_or_jump()
					-- elseif has_words_before() then
					-- 	-- cmp.complete()
					-- 	fallback()
				else
					fallback()
				end
			end, { "i", "s" }),
			["jj"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["kk"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					-- elseif luasnip.jumpable(-1) then
					-- 	luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		},
		-- ... Your other mappings ...
		-- mapping = {
		--     ["<Tab>"] = cmp.mapping({
		--         c = function()
		--             if cmp.visible() then
		--                 cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		--             else
		--                 cmp.complete()
		--             end
		--         end,
		--         i = function(fallback)
		--             if cmp.visible() then
		--                 cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		--             -- elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
		--             --     vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
		--             else
		--                 -- vim.api.nvim_feedkeys('\\<tab>', 'm', true)
		--                 fallback()
		--             end
		--         end,
		--         -- s = function(fallback)
		--         --     if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
		--         --         vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
		--         --     else
		--         --         fallback()
		--         --     end
		--         -- end
		--     }),
		--     ["<S-Tab>"] = cmp.mapping({
		--         c = function()
		--             if cmp.visible() then
		--                 cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		--             else
		--                 cmp.complete()
		--             end
		--         end,
		--         i = function(fallback)
		--             if cmp.visible() then
		--                 cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		--             -- elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
		--             --     return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
		--             else
		--                 fallback()
		--             end
		--         end,
		--         s = function(fallback)
		--             if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
		--                 return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
		--             else
		--                 fallback()
		--             end
		--         end
		--     }),
		--     ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
		--     ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
		--     ['<C-n>'] = cmp.mapping({
		--         c = function()
		--             if cmp.visible() then
		--                 cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		--             else
		--                 vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
		--             end
		--         end,
		--         i = function(fallback)
		--             if cmp.visible() then
		--                 cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		--             else
		--                 fallback()
		--             end
		--         end
		--     }),
		--     ['<C-p>'] = cmp.mapping({
		--         c = function()
		--             if cmp.visible() then
		--                 cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
		--             else
		--                 vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
		--             end
		--         end,
		--         i = function(fallback)
		--             if cmp.visible() then
		--                 cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
		--             else
		--                 fallback()
		--             end
		--         end
		--     }),
		--     ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
		--     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
		--     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
		--     ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
		--     ['<CR>'] = cmp.mapping({
		--         i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
		--         c = function(fallback)
		--             if cmp.visible() then
		--                 cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
		--             else
		--                 fallback()
		--             end
		--         end
		--     }),
		--     -- ... Your other configuration ...
		-- },
		sources = cmp.config.sources({
			{ name = "jupynium", priority = 5 },
			{ name = "nvim_lsp", priority = 2 },
			-- { name = "nvim_lua" },
			{ name = "luasnip",  priority = 3 },
			{ name = "buffer",   priority = 1 },
			{ name = "path",     priority = 4 },
		}),
		-- ... Your other configuration ...

		-- ... Your other configuration ...
	})

	-- Use buffer source for `/`.
	cmp.setup.cmdline("/", {
		completion = { autocomplete = false },
		sources = {
			-- { name = 'buffer' }
			{ name = "buffer", opts = { keyword_pattern = [=[[^[:blank:]].*]=] } },
		},
	})

	-- Use cmdline & path source for ':'.
	cmp.setup.cmdline(":", {
		completion = { autocomplete = false },
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return M
