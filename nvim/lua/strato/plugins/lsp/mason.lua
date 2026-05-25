return {
	"mason-org/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = { "neovim/nvim-lspconfig" },
		},
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- LSP servers (mason-lspconfig auto-enables them via vim.lsp.enable)
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"graphql",
				"emmet_language_server",
				"prismals",
				"pyright",
				"gopls",
				"jsonls",
				"yamlls",
				"bashls",
			},
			-- automatic_enable defaults to true (since v2.x)
		})

		-- Formatters and linters (not LSP servers)
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
				"prettierd",
				"stylua",
				"shfmt",
				"goimports",
				"gofumpt",
				"eslint_d",
				"golangci-lint",
				"ruff",
				"black",
			},
			auto_update = false,
			run_on_start = true,
		})
	end,
}
