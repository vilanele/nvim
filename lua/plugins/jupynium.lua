return {
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
		-- config = function()
		-- 	require('jupynium').setup({
		-- 		-- remote_url = "http://10.7.0.2:3334",
		-- 		-- token = "<your_token_here>",
		-- 		default_notebook_URL = "http://127.0.0.1:8888"
		-- 	})
		-- end
		-- build = "conda run --no-capture-output -n jupynium pip install .",
		-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
	},
	"rcarriga/nvim-notify", -- optional
	"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
}
