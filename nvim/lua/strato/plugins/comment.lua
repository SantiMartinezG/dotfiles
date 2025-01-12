return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			-- Safely import the Comment plugin
			local comment = require("Comment")
			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

			-- Configure and enable the Comment plugin
			comment.setup({
				-- Set up pre-hook for commenting in tsx, jsx, svelte, and html files
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
		end,
	},
}
