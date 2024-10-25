return {
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
		config = function()
			require('jupynium').setup({
				-- 		-- remote_url = "http://10.7.0.2:3334",
				-- 		-- token = "<your_token_here>",
				-- 		default_notebook_URL = "http://127.0.0.1:8888"
				auto_download_ipynb = false,
				-- auto_close_tab = false,
				shortsighted = true,
				textobjects = { use_default_keybindings = false }
			})
			vim.keymap.set(
				{ "n", "x", "o" },
				"cj",
				"<cmd>lua require'jupynium.textobj'.goto_next_cell_separator()<cr>",
				{ noremap = true, silent = true, desc = "Go to next Jupynium cell" }
			)
			vim.keymap.set(
				{ "n", "x", "o" },
				"ck",
				"<cmd>lua require'jupynium.textobj'.goto_previous_cell_separator()<cr>",
				{ noremap = true, silent = true, desc = "Go to previous Jupynium cell" }
			)
		end
		-- build = "conda run --no-capture-output -n jupynium pip install .",
		-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
	},
	"rcarriga/nvim-notify", -- optional
	"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
}
