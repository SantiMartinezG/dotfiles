return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy", -- Load the plugin after startup
		opts = {
			timeout = 5000, -- Notification display time in milliseconds
			max_width = 80, -- Maximum width of notification window
			max_height = 20, -- Maximum height of notification window
			stages = "slide", -- Animation style
			icons = { -- Custom icons for different message types
				ERROR = "✗",
				WARN = "⚠",
				INFO = "ℹ",
				DEBUG = "⚙",
				TRACE = "✎",
			},
		},
		init = function()
			-- Set nvim-notify as the default notification function
			vim.notify = require("notify")
		end,
		keys = {
			{
				"<leader>un",
				function()
					-- Dismiss all notifications silently
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
	},
}
