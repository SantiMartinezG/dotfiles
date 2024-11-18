return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- Import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- Configure treesitter
			treesitter.setup({
				-- Syntax highlighting configuration
				highlight = {
					enable = true,
				},

				-- Indentation configuration
				indent = { enable = true },

				-- Autotagging configuration (using nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},

				-- List of language parsers to ensure are installed
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"astro",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
					"c",
					"go",
				},

				-- Incremental selection configuration
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
}
