return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "jonarrien/telescope-cmdline.nvim" },
	config = function()
		local action_state = require("telescope.actions.state")
		local actions = require("telescope.actions")

		function StartFloatingWindow(prompt_bufnr)
			local width = vim.api.nvim_get_option("columns")
			local height = vim.api.nvim_get_option("lines")
			local win_height = math.ceil(height * 3 / 4)
			local win_width = math.ceil(width * 0.7)

			local entry = action_state.get_selected_entry()
			local buf = vim.api.nvim_create_buf(true, false)

			local opts = {
				relative = "editor",
				anchor = "NW",
				width = win_width,
				height = win_height,
				row = math.ceil((height - win_height) / 2),
				col = math.ceil((width - win_width) / 2),
				border = "rounded",
				title = entry.value,
				title_pos = "left",
				zindex = 1,
			}
			-- vim.api.nvim_set_current_buf(buf)

			vim.api.nvim_open_win(buf, true, opts)
			-- vim.cmd(":ZenMode")
			vim.cmd(":edit " .. entry.path)
			vim.cmd(":stopinsert")
		end

		function OpenLeft(prompt_bufnr)
			local selected_entry = action_state.get_selected_entry()
			actions.close(prompt_bufnr)
			vim.cmd("leftabove vsplit " .. selected_entry.value)
		end

		function OpenRight(prompt_bufnr)
			local selected_entry = action_state.get_selected_entry()
			actions.close(prompt_bufnr)
			vim.cmd("rightbelow vsplit " .. selected_entry.value)
		end

		function OpenDown(prompt_bufnr)
			local selected_entry = action_state.get_selected_entry()
			actions.close(prompt_bufnr)
			vim.cmd("rightbelow split " .. selected_entry.value)
		end

		function OpenUp(prompt_bufnr)
			local selected_entry = action_state.get_selected_entry()
			actions.close(prompt_bufnr)
			vim.cmd("leftabove split " .. selected_entry.value)
		end

		-- function DeleteSelectedBuffer(prompt_bufnr)
		-- 	local entry = action_state.get_selected_entry()
		-- 	local picker = action_state.get_current_picker(prompt_bufnr)
		-- 	vim.api.nvim_buf_delete(entry.bufnr, {})
		-- 	picker:refresh()
		-- end
		--

		local function get_filetypes()
			return {
				"systemd",
				"bash",
				"zsh",
				"lua",
				"python",
				"javascript",
				"html",
				"css",
				-- add more as needed
			}
		end

		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local conf = require("telescope.config").values

		local function set_filetype_picker(opts)
			opts = opts or {}
			pickers.new(opts, {
				prompt_title = "Select Filetype",
				finder = finders.new_table {
					results = get_filetypes(),
				},
				sorter = conf.generic_sorter(opts),
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						-- print(vim.inspect(selection))
						vim.notify("Filetype set to: " .. selection[1], vim.log.levels.INFO)
						vim.cmd("set filetype=" .. selection[1])

						-- vim.api.nvim_put({ selection[1] }, "", false, true)
					end)
					return true
				end,
				-- attach_mappings = function(prompt_bufnr, map)
				-- 	print("Bonjoour")
				-- 	local selection = action_state.get_selected_entry()
				-- 	actions.close(prompt_bufnr)
				-- vim.cmd("set filetype=" .. selection[1])
				-- 	-- vim.cmd("syntax on")
				-- 	-- vim.cmd("filetype detect")
				-- 	vim.notify("Filetype set to: " .. selection[1], vim.log.levels.INFO)
				-- 	-- if selection then
				-- 	-- 	vim.bo.filetype = selection[1]
				-- 	vim.notify("Filetype set to: " .. selection[1], vim.log.levels.INFO)
				-- 	-- end
				--
				-- 	-- map("i", "<CR>", set_filetype)
				-- 	-- map("n", "<CR>", set_filetype)
				-- 	-- set_filetype()
				--
				-- 	return true
				-- end,
			}):find()
		end

		vim.api.nvim_create_user_command('SetFiletype', function()
			set_filetype_picker()
		end, {})

		vim.api.nvim_set_keymap('n', ',,f', ':SetFiletype<CR>',
			{ noremap = true, silent = true })



		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "vertical",
				layout_config = {
					prompt_position = "top",
					vertical = { width = 0.4, height = 0.5 },
				},
				mappings = {
					i = {
						["<C-h>"] = OpenLeft,
						["<C-l>"] = OpenRight,
						["<C-j>"] = OpenDown,
						["<C-k>"] = OpenUp,
					},
				},
			},
			extensions = {
				cmdline = {
					output_pane = {
						enabled = true,
					},
				},
				file_browser = {
					mappings = {
						["i"] = {
							["<C-h>"] = OpenLeft,
							["<C-l>"] = OpenRight,
							["<C-j>"] = OpenDown,
							["<C-k>"] = OpenUp,
						},
					},
				},
			},
			pickers = {
				find_files = {
					-- theme = "dropdown",
					mappings = {
						i = {
							["<C-o>"] = StartFloatingWindow,
						},
						n = {
							["<C-o>"] = StartFloatingWindow,
						},
					},
				},
				buffers = {
					mappings = {
						i = {
							["<C-d>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
			},
		})

		-- require("telescope").load_extension("cmdline")

		local bt = require("telescope.builtin")
		local find_files = bt.find_files
		local command_history = bt.command_history
		local search_history = bt.search_history
		local buffers = bt.buffers
		local registers = bt.registers
		local colorscheme = bt.colorscheme
		local quickfix = bt.quickfix
		local diagnostics = bt.diagnostics
		local lsp_document_symbols = bt.lsp_document_symbols
		local live_grep = bt.live_grep

		-- vim.keymap.set("n", ":", "<cmd>Telescope cmdline<cr>")
		vim.keymap.set("n", ",,s", require("auto-session.session-lens").search_session, { noremap = true })
		vim.keymap.set("n", ",r", "<cmd>Telescope neoclip<cr>")
		vim.keymap.set("n", ",g", function()
			live_grep()
		end)
		-- vim.keymap.set("n", ",f", function()
		-- 	find_files()
		-- end)
		vim.keymap.set("n", ",z", function()
			find_files({ cwd = "/home/vilanele/.config/zsh/" })
		end)
		vim.keymap.set("n", ",l", function()
			find_files({ cwd = "/home/vilanele/.config/nvim/lua" })
		end)
		vim.keymap.set("n", ",n", function()
			find_files({ cwd = "/home/vilanele/.config/nvim/" })
		end)
		vim.keymap.set("n", ",p", function()
			find_files({ cwd = "/home/vilanele/.config/nvim/lua/plugins" })
		end)
		vim.keymap.set("n", ",s", function()
			find_files({ cwd = "/home/vilanele/.config/nvim/snippets" })
		end)
		vim.keymap.set("n", ",k", function()
			find_files({ cwd = "/home/vilanele/.config/zellij/layouts/" })
		end)
		vim.keymap.set("n", ",m", function()
			find_files({
				cwd = "/home/vilanele/conf",
			})
		end)
		vim.keymap.set("n", ",,b", function()
			require("telescope").extensions.file_browser.file_browser()
		end)
		vim.keymap.set("n", ",h", function()
			command_history()
		end)
		vim.keymap.set("n", ",t", function()
			search_history()
		end)
		vim.keymap.set("n", ",b", function()
			buffers()
		end)
		vim.keymap.set("n", ",,r", function()
			registers()
		end)
		vim.keymap.set("n", ",,c", function()
			colorscheme()
		end)
		vim.keymap.set("n", ",q", function()
			quickfix()
		end)
		vim.keymap.set("n", ",dd", function()
			diagnostics()
		end)
		vim.keymap.set("n", ",df", function()
			lsp_document_symbols({ symbols = "function" })
		end)
		vim.keymap.set("n", ",dc", function()
			lsp_document_symbols({ symbols = "class" })
		end)
		vim.keymap.set("n", ",dv", function()
			lsp_document_symbols({ symbols = "variable" })
		end)
		vim.keymap.set("n", ",ds", function()
			lsp_document_symbols({ symbols = "constant" })
		end)
		vim.keymap.set("n", ",dm", function()
			lsp_document_symbols({ symbols = "method" })
		end)
	end,
}
