return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				-- Core
				"vim",
				"vimdoc",
				"lua",
				"query",
				"regex",
				-- Shell
				"bash",
				"fish",
				-- Web
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"yaml",
				-- Backend
				"go",
				"gomod",
				"gosum",
				"gowork",
				"python",
				-- Markup / config
				"markdown",
				"markdown_inline",
				"dockerfile",
				"toml",
				-- Git
				"gitcommit",
				"gitignore",
				"git_config",
				"git_rebase",
				"diff",
			},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>v",
					node_incremental = "<leader>v",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
				},
			},
		})
	end,
}
