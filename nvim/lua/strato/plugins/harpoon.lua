return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		local map = vim.keymap.set

		-- Core actions
		map("n", "<leader>ma", function()
			harpoon:list():add()
		end, { desc = "Harpoon Add" })
		map("n", "<leader>mm", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Menu" })
		map("n", "<leader>md", function()
			harpoon:list():remove()
		end, { desc = "Harpoon Remove" })

		-- Cycle through marks
		map("n", "<C-n>", function()
			harpoon:list():next()
		end, { desc = "Harpoon Next" })
		map("n", "<C-p>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon Prev" })

		-- Quick select 1-4
		for i = 1, 4 do
			map("n", "<leader>m" .. i, function()
				harpoon:list():select(i)
			end, { desc = "Harpoon " .. i })
		end
	end,
}
