return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/lazydev.nvim", opts = {} },
		},
		config = function()
			-- Import required modules
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local keymap = vim.keymap -- for conciseness

			-- LSP Keybindings Configuration
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings
					local opts = { buffer = ev.buf, silent = true }

					-- Keybindings for LSP functionalities
					-- Navigation
					keymap.set(
						"n",
						"gR",
						"<cmd>Telescope lsp_references<CR>",
						{ desc = "Show LSP references", buffer = ev.buf }
					)
					keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
					keymap.set(
						"n",
						"gd",
						"<cmd>Telescope lsp_definitions<CR>",
						{ desc = "Show LSP definitions", buffer = ev.buf }
					)
					keymap.set(
						"n",
						"gi",
						"<cmd>Telescope lsp_implementations<CR>",
						{ desc = "Show LSP implementations", buffer = ev.buf }
					)
					keymap.set(
						"n",
						"gt",
						"<cmd>Telescope lsp_type_definitions<CR>",
						{ desc = "Show LSP type definitions", buffer = ev.buf }
					)

					-- Code actions and modifications
					keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ desc = "See available code actions", buffer = ev.buf }
					)
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", buffer = ev.buf })

					-- Diagnostics
					keymap.set(
						"n",
						"<leader>D",
						"<cmd>Telescope diagnostics bufnr=0<CR>",
						{ desc = "Show buffer diagnostics", buffer = ev.buf }
					)
					keymap.set(
						"n",
						"<leader>d",
						vim.diagnostic.open_float,
						{ desc = "Show line diagnostics", buffer = ev.buf }
					)
					keymap.set(
						"n",
						"[d",
						vim.diagnostic.goto_prev,
						{ desc = "Go to previous diagnostic", buffer = ev.buf }
					)
					keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", buffer = ev.buf })

					-- Documentation and utility
					keymap.set(
						"n",
						"K",
						vim.lsp.buf.hover,
						{ desc = "Show documentation for what is under cursor", buffer = ev.buf }
					)
					keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", buffer = ev.buf })
				end,
			})

			-- Autocompletion Configuration
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Diagnostic Signs Configuration
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- LSP Server Configuration
			mason_lspconfig.setup_handlers({
				-- Default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- Svelte server configuration
				["svelte"] = function()
					lspconfig["svelte"].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts" },
								callback = function(ctx)
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
								end,
							})
						end,
					})
				end,

				-- GraphQL server configuration
				["graphql"] = function()
					lspconfig["graphql"].setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
					})
				end,

				-- Emmet language server configuration
				["emmet_ls"] = function()
					lspconfig["emmet_ls"].setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
							"astro",
						},
					})
				end,

				-- Lua server configuration
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,

				-- Go server configuration
				["gopls"] = function()
					lspconfig["gopls"].setup({
						capabilities = capabilities,
					})
				end,

				-- Astro server configuration
				["astro"] = function()
					lspconfig["astro"].setup({
						capabilities = capabilities,
						filetypes = { "astro" },
					})
				end,
			})
		end,
	},
}
