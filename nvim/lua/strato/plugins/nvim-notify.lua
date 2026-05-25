return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	keys = {
		{
			"<leader>un",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss notifications",
		},
	},
	opts = {
		timeout = 5000,
		stages = "fade",
		render = "minimal",
		-- Match WezTerm background so notifications blend with the transparent theme
		background_colour = "#00141A",
		icons = { ERROR = "✗", WARN = "⚠", INFO = "●", DEBUG = "⚙", TRACE = "✎" },
		max_width = function()
			return math.floor(vim.o.columns * 0.4)
		end,
		max_height = function()
			return math.floor(vim.o.lines * 0.5)
		end,
	},
	init = function()
		vim.notify = require("notify")
	end,
}
