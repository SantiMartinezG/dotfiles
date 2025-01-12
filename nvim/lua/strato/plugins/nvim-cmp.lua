return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- Source for text in buffer
			"hrsh7th/cmp-path", -- Source for file system paths
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*", -- Use the latest major version (first number of the latest release)
				build = "make install_jsregexp", -- Install jsregexp (optional)
			},
			"saadparwaiz1/cmp_luasnip", -- For autocompletion
			"rafamadriz/friendly-snippets", -- Useful snippets
			"onsails/lspkind.nvim", -- VS Code-like pictograms
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- Load VS Code-style snippets from installed plugins (e.g. friendly-snippets)
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				-- Completion window configuration
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},

				-- Configure how nvim-cmp interacts with snippet engine
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				-- Key mappings for completion
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
					["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
					["<C-Space>"] = cmp.mapping.complete(), -- Show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- Close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection
				}),

				-- Sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP
					{ name = "luasnip" }, -- Snippets
					{ name = "buffer" }, -- Text within current buffer
					{ name = "path" }, -- File system paths
				}),

				-- Configure lspkind for VS Code-like pictograms in completion menu
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
}
