return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				floats = "transparent",
				sidebars = "transparent",
			},
		})
		vim.cmd.colorscheme("solarized-osaka")
	end,
}
