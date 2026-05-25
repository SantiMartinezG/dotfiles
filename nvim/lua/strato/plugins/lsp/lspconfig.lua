return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Apply capabilities to ALL servers via wildcard config
		vim.lsp.config("*", { capabilities = capabilities })

		-- Server-specific configs (extend defaults from nvim-lspconfig)
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
					hint = { enable = true },
				},
			},
		})

		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					gofumpt = true,
					staticcheck = true,
					usePlaceholders = true,
					completeUnimported = true,
					hints = {
						parameterNames = true,
						assignVariableTypes = true,
						compositeLiteralFields = true,
						constantValues = true,
						functionTypeParameters = true,
						rangeVariableTypes = true,
					},
				},
			},
		})

		vim.lsp.config("ts_ls", {
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "literal",
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = false,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
					},
				},
				javascript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
						includeInlayFunctionParameterTypeHints = true,
						includeInlayVariableTypeHints = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
					},
				},
			},
		})

		vim.lsp.config("pyright", {
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "basic",
						autoImportCompletions = true,
					},
				},
			},
		})

		-- Diagnostic UI
		vim.diagnostic.config({
			virtual_text = { prefix = "●" },
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
				},
			},
		})

		-- Buffer-local keymaps on LSP attach
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspKeys", { clear = true }),
			callback = function(ev)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc, silent = true })
				end

				-- Navigation (Telescope-powered)
				map("gd", "<cmd>Telescope lsp_definitions<cr>", "Goto Definition")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gi", "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation")
				map("gR", "<cmd>Telescope lsp_references<cr>", "References")
				map("<leader>D", "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition")

				-- Actions
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("<leader>rs", "<cmd>LspRestart<cr>", "Restart LSP")

				-- Diagnostics
				map("<leader>d", vim.diagnostic.open_float, "Line Diagnostic")
				map("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev Diagnostic")
				map("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next Diagnostic")
			end,
		})
	end,
}
