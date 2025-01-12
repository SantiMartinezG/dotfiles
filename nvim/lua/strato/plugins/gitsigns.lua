return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Helper function to set keymaps
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation keymaps
				map("n", "]h", gs.next_hunk, "Go to next hunk")
				map("n", "[h", gs.prev_hunk, "Go to previous hunk")

				-- Actions keymaps
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")

				-- Visual mode actions
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage selected hunk")
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset selected hunk")

				-- Buffer actions
				map("n", "<leader>hS", gs.stage_buffer, "Stage entire buffer")
				map("n", "<leader>hR", gs.reset_buffer, "Reset entire buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo last staged hunk")

				-- Preview and blame
				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame current line")
				map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

				-- Diff actions
				map("n", "<leader>hd", gs.diffthis, "Diff this file")
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "Diff against last commit")

				-- Text object for hunks
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
			end,
		},
	},
}
