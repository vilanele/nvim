M = {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle outline
		vim.keymap.set("n", ",,o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

		require("outline").setup({
			preview_window = { auto_preview = false },
			outline_window = { position = 'right' }
			-- Your setup opts here (leave empty to use defaults)
		})
	end,
}

return M
