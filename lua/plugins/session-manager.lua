return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			log_level = "info",
			auto_session_enable_last_session = false,
			auto_session_root_dir = "/home/vilanele/.config/sessions/",
			auto_session_enabled = true,
			auto_save_enabled = true,
			-- auto_restore_enabled = false,
			-- auto_session_suppress_dirs = nil,
			-- auto_session_use_git_branch = nil,
			-- the configs below are lua only
			-- bypass_session_save_file_types = nil,
			-- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			auto_session_create_enabled = false,
			session_lens = {
				-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
				-- buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
	end,
}
