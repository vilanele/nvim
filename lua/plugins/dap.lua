return {
	"mfussenegger/nvim-dap",
	config = function()
		vim.keymap.set("n", "cc", require("dap").continue)
		vim.keymap.set("n", "tb", require("dap").toggle_breakpoint)
		vim.keymap.set("n", "ds", require("dap").stop)
	end,
}
