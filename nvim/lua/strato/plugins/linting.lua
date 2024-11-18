return {
	{
		-- Specify the plugin
		"mfussenegger/nvim-lint",

		-- Set up events to trigger the plugin
		event = { "BufReadPre", "BufNewFile" },

		-- Configuration function
		config = function()
			-- Require the lint module
			local lint = require("lint")

			-- Define linters for specific file types
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				astro = { "eslint_d" },
				python = { "pylint" },
			}

			-- Create an autocommand group for linting
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			-- Set up autocommands to trigger linting
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			-- Set up a keybinding to manually trigger linting
			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
}
