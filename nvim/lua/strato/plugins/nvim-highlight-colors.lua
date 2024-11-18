return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-highlight-colors").setup({
				render = "virtual",
				virtual_symbol = "●",
				virtual_symbol_prefix = "",
				virtual_symbol_suffix = " ",
				virtual_symbol_position = "inline",
				enable_named_colors = true,
				enable_tailwind = true,
				enable_hex = true,
				enable_rgb = true,
				enable_hsl = true,
				enable_var_usage = true,
				enable_short_hex = true,
				custom_colors = {},
				exclude_filetypes = {},
				exclude_buftypes = {},
			})
		end,
	},
}
