return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			-- Import required modules
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")
			-- Mason setup
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			-- Mason LSP config setup
			mason_lspconfig.setup({
				-- List of LSP servers to install
				ensure_installed = {
					"ts_ls", -- TypeScript
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind CSS
					"svelte", -- Svelte
					"astro", -- Astro
					"lua_ls", -- Lua
					"graphql", -- GraphQL
					"emmet_ls", -- Emmet
					"prismals", -- Prisma
					"pyright", -- Python
					"gopls", -- Go
				},
			})
			-- Mason Tool Installer setup
			mason_tool_installer.setup({
				-- List of formatters, linters and debuggers to install
				ensure_installed = {
					"prettier", -- Universal formatter
					"stylua", -- Lua formatter
					"isort", -- Python import sorter
					"black", -- Python formatter
					"pylint", -- Python linter
					"eslint_d", -- JavaScript linter
					"delve", -- Go Debugger
				},
			})
		end,
	},
}
