return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup()

		-- parsers
		ts.install({
			"vim",
			"vimdoc",
			"lua",
			"query",
			"regex",
			"bash",
			"fish",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"yaml",
			"go",
			"gomod",
			"gosum",
			"gowork",
			"python",
			"markdown",
			"markdown_inline",
			"dockerfile",
			"toml",
			"gitcommit",
			"gitignore",
			"git_config",
			"git_rebase",
			"diff",
		})

		-- open all folds by default
		vim.opt.foldlevelstart = 99

		-- enable highlight + indent + folds per filetype
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"vim",
				"lua",
				"bash",
				"fish",
				"html",
				"css",
				"javascript",
				"typescript",
				"typescriptreact",
				"json",
				"yaml",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"python",
				"markdown",
				"dockerfile",
				"toml",
				"gitcommit",
				"gitignore",
				"gitconfig",
				"gitrebase",
				"diff",
			},
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
			end,
		})
	end,
}
