return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	version = "3.*",
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "Find" },
			{ "<leader>h", group = "Hunks (Git)" },
			{ "<leader>m", group = "Harpoon" },
			{ "<leader>r", group = "Rename/Restart" },
			{ "<leader>s", group = "Split" },
			{ "<leader>t", group = "Tab" },
			{ "<leader>x", group = "Trouble" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer-local keymaps",
		},
	},
}
