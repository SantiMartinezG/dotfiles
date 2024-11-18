return {
	{
		"kdheepak/lazygit.nvim",
		-- List of commands provided by the plugin
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- Optional dependency for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- Keybinding configuration
		-- It's recommended to set the keybinding here to load the plugin on first use
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
		},
		-- You can add additional configuration options here if needed
		-- For example:
		-- config = function()
		--   vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
		--   vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
		-- end,
	},
}
