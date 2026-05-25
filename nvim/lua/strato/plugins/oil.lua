return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-mini/mini.icons" },
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
		{ "<leader>-", "<CMD>Oil .<CR>", desc = "Open project root" },
	},
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		columns = { "icon" },
		view_options = {
			show_hidden = true,
			natural_order = "fast",
		},
		keymaps = {
			["q"] = "actions.close",
		},
	},
}
