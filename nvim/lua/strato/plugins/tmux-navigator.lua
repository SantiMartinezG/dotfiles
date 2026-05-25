-- Seamless navigation between nvim splits and tmux panes via <C-h/j/k/l>.
return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Tmux/Win Left" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux/Win Down" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux/Win Up" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux/Win Right" },
	},
}
