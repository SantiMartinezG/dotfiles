return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		render = "virtual",
		virtual_symbol = "■",
		virtual_symbol_position = "inline", -- like VS Code (symbol before value)
		-- Color format support
		enable_hex = true,
		enable_short_hex = true,
		enable_rgb = true,
		enable_hsl = true,
		enable_hsl_without_function = true,
		enable_var_usage = true, -- CSS custom properties: var(--my-color)
		enable_named_colors = true, -- "red", "blue", etc.
		enable_tailwind = true,
		exclude_filetypes = {
			"alpha",
			"help",
			"lazy",
			"mason",
			"oil",
			"Trouble",
			"trouble",
			"noice",
			"notify",
			"TelescopePrompt",
			"TelescopeResults",
		},
	},
}
