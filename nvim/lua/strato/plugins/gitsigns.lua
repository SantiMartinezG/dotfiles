return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		signs_staged_enable = true,
		current_line_blame = false, -- toggle on demand via <leader>hb
		current_line_blame_opts = { delay = 500 },
		preview_config = { border = "rounded" },
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation (diff-aware: falls back to vim builtin when in :diffsplit)
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gs.nav_hunk("next")
				end
			end, "Next hunk")

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gs.nav_hunk("prev")
				end
			end, "Prev hunk")

			map("n", "]H", function()
				gs.nav_hunk("last")
			end, "Last hunk")
			map("n", "[H", function()
				gs.nav_hunk("first")
			end, "First hunk")

			-- Stage / reset
			map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage selected lines")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset selected lines")
			map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
			map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

			-- Preview / diff
			map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
			map("n", "<leader>hd", gs.diffthis, "Diff against index")
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, "Diff against last commit")

			-- Blame
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Blame line")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

			-- Text object: hunk (use with d/y/v)
			map({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<cr>", "Select hunk")
		end,
	},
}
