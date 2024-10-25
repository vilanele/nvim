return {
	{
		"SUSTech-data/neopyter",
		---@type neopyter.Option
		opts = {
			mode = "direct",
			remote_address = "127.0.0.1:9001",
			file_pattern = { "*.ju.*" },
			on_attach = function(bufnr)
				-- do some buffer keymap
			end,
			highlight = {
				enable = true,
				shortsighted = false,
			},
			parser = {
				-- trim leading/tailing whitespace of cell
				trim_whitespace = false,
			}
		},
	}, {
	"AbaoFromCUG/websocket.nvim"
}
}
