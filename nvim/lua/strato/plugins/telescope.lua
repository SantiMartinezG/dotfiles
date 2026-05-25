return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-mini/mini.icons",
	},
	keys = {
		-- File pickers
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Grep files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		-- Vim/help
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find commands" },
		-- LSP-related
		{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
		-- Current buffer search
		{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search in buffer" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
					horizontal = { preview_width = 0.55 },
				},
				sorting_strategy = "ascending",
				file_ignore_patterns = {
					"node_modules/",
					"%.git/",
					"%.next/",
					"dist/",
					"build/",
					"%.lock",
					"package%-lock%.json",
					"yarn%.lock",
					"__pycache__/",
					"%.pyc",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		pcall(telescope.load_extension, "fzf")
	end,
}
