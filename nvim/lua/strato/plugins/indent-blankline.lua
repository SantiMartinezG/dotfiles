return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "craftzdog/solarized-osaka.nvim" },
	opts = {
		indent = { char = "┊", tab_char = "│" },
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			highlight = { "IblScope" },
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"lazy",
				"mason",
				"oil",
				"Trouble",
				"trouble",
				"lspinfo",
				"checkhealth",
				"man",
				"gitcommit",
				"TelescopePrompt",
				"TelescopeResults",
				"notify",
			},
		},
	},
	config = function(_, opts)
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			local colors = require("solarized-osaka.colors").setup()
			vim.api.nvim_set_hl(0, "IblIndent", { fg = colors.base02, nocombine = true })
			vim.api.nvim_set_hl(0, "IblScope", { fg = colors.cyan, nocombine = true })
		end)
		require("ibl").setup(opts)
	end,
}
