return {
	"folke/trouble.nvim",
	version = "3.*",
	cmd = "Trouble",
	keys = {
		-- Diagnostics
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
		{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
		-- LSP-related
		{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
		{ "<leader>cr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP refs/defs/impls" },
		-- Lists
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
	},
	opts = {
		win = { position = "bottom", size = 10 },
		focus = true, -- focus the trouble window when opened
	},
}
