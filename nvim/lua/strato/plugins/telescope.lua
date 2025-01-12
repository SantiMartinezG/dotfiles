return {
	-- Core Telescope plugin
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x", -- Specify the version branch

	-- Define plugin dependencies
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required dependency for Telescope
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Fast fuzzy finder
		"nvim-tree/nvim-web-devicons", -- Adds file icons to Telescope
		"folke/todo-comments.nvim", -- Highlights and searches for todo comments
	},

	config = function()
		-- Import required modules
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- Define custom actions for Telescope
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix") -- Open selected items in Trouble's quickfix list
			end,
		})

		-- Configure Telescope
		telescope.setup({
			defaults = {
				path_display = { "smart" }, -- Smartly truncates file paths
				mappings = {
					i = { -- Insert mode mappings
						["<C-k>"] = actions.move_selection_previous, -- Move to previous result
						["<C-j>"] = actions.move_selection_next, -- Move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist, -- Send to quickfix and open Trouble
						["<C-t>"] = trouble_telescope.open, -- Open selected items in Trouble
					},
				},
			},
		})

		-- Load the FZF native extension for better performance
		telescope.load_extension("fzf")

		-- Set up keymaps for Telescope functions
		local keymap = vim.keymap -- Alias for brevity

		-- Find files in current working directory
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		-- Find recently opened files
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		-- Search for a string in your cwd
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		-- Find word under cursor in cwd
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		-- Locate TODO comments
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
