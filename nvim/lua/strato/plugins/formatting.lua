return {
	"stevearc/conform.nvim",
	-- Load the plugin when a file is read or a new file is created
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			-- Define formatters for different file types
			formatters_by_ft = {
				-- Use Prettier for various web-related file types
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				astro = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				-- Use StyLua for Lua files
				lua = { "stylua" },
				-- Use isort and black for Python files (in this order)
				python = { "isort", "black" },
				-- Use gofmt for Go files
				go = { "gofmt" },
			},
			-- Configure format-on-save behavior
			format_on_save = {
				-- Fallback to LSP formatting if conform formatter is not available
				lsp_fallback = true,
				-- Run formatter synchronously (waits for formatter to finish before saving)
				async = false,
				-- Timeout for formatting (in milliseconds)
				timeout_ms = 1000,
			},
		})

		-- Set up a keybinding for manual formatting
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
