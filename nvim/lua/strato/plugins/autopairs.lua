return {
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			-- Import and configure nvim-autopairs
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true, -- Enable Treesitter integration
				ts_config = {
					-- Language-specific Treesitter configurations
					lua = { "string" }, -- Disable pair insertion in Lua string nodes
					javascript = { "template_string" }, -- Disable pair insertion in JavaScript template string nodes
					java = false, -- Disable Treesitter checks for Java
				},
			})

			-- Set up integration with nvim-cmp
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")

			-- Connect autopairs with completion system
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
