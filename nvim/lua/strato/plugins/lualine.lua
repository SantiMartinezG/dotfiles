return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-mini/mini.icons" },
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			component_separators = "",
			section_separators = "",
			disabled_filetypes = { statusline = { "alpha", "lazy", "mason" } },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			-- filename intentionally omitted — handled by incline.nvim
			lualine_c = { "diagnostics" },
			lualine_x = { "diff", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
