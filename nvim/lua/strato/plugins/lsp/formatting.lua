return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Format file or range",
		},
		{
			"<leader>cF",
			function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				vim.notify("Autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
			end,
			desc = "Toggle format on save",
		},
	},
	opts = {
		formatters_by_ft = {
			-- Web (prettierd preferred, prettier as fallback)
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			-- Python (ruff handles both, much faster than black+isort)
			python = { "ruff_organize_imports", "ruff_format" },
			-- Lua / Shell
			lua = { "stylua" },
			sh = { "shfmt" },
			-- Go (goimports for imports, gofumpt for stricter formatting)
			go = { "goimports", "gofumpt" },
		},
		format_on_save = function(bufnr)
			-- Global toggle: vim.g.disable_autoformat
			if vim.g.disable_autoformat then
				return
			end
			-- Skip filetypes where autoformat is destructive
			local ignore_filetypes = { "markdown", "diff" }
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return
			end
			return { timeout_ms = 3000, lsp_format = "fallback" }
		end,
	},
}
