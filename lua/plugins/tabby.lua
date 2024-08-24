M = {
	"nanozuki/tabby.nvim",
	event = "VimEnter",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.o.showtabline = 2
		vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
		-- require('tabby.tabline').use_preset('active_wins_at_end', {
		--   theme = {
		--     fill = 'TabLineFill',       -- tabline background
		--     head = 'TabLine',           -- head element highlight
		--     current_tab = 'TabLineSel', -- current tab label highlight
		--     tab = 'TabLine',            -- other tab label highlight
		--     current_win = 'TabLineSel',
		--     win = 'TabLineSel',            -- window highlight
		--     tail = 'TabLine',           -- tail element highlight
		--   },
		--   nerdfont = true,              -- whether use nerdfont
		--   lualine_theme = nil,          -- lualine theme name
		--   tab_name = {
		--     name_fallback = function(tabid)
		--       return tabid
		--     end,
		--   },
		-- })
		local theme = {
			fill = "TabLineFill",
			-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
			head = "TabLine",
			current_tab = "TabLineSel",
			-- current_tab = { fg = "#2F10F6", bg = "#190E98", style = "italic" },
			tab = "TabLine",
			win = "TabLine",
			tail = "TabLine",
		}
		-- require("tabby.tabline").use_preset("tab_only", {
		-- 	-- theme = theme,
		-- 	nerdfont = true,
		-- 	lualine_theme = "gruvbox_light",
		-- })
		require("tabby.tabline").set(function(line)
			return {
				{
					-- { "  ", hl = theme.head },
					line.sep("", theme.head, theme.fill),
				},
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current_tab or theme.tab
					return {
						line.sep("", hl, theme.fill),
						tab.is_current() and "" or "",
						tab.number(),
						tab.name(),
						-- tab.close_btn(''), -- show a close button
						line.sep("", hl, theme.fill),
						hl = hl,
						margin = " ",
					}
				end),
				line.spacer(),
				-- shows list of windows in tab
				-- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
				--   return {
				--     line.sep('', theme.win, theme.fill),
				--     win.is_current() and '' or '',
				--     win.buf_name(),
				--     line.sep('', theme.win, theme.fill),
				--     hl = theme.win,
				--     margin = ' ',
				--   }
				-- end),
				{
					line.sep("", theme.tail, theme.fill),
					-- { "  ", hl = theme.tail },
				},
				hl = theme.fill,
			}
		end)
		-- require("tabby.tabline").set(function(line) end, {})
	end,
	keys = {
		-- { "<C-a>", "<cmd>tabprevious<cr>", "i" },
		-- { "<C-q>", "<cmd>tabnext<cr>", "kkkkkkkk	i" },
	},
}

return M
