return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-mini/mini.icons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header
		dashboard.section.header.val = {
			" ███████╗████████╗██████╗  █████╗ ████████╗ ██████╗ ",
			" ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗",
			" ███████╗   ██║   ██████╔╝███████║   ██║   ██║   ██║",
			" ╚════██║   ██║   ██╔══██╗██╔══██║   ██║   ██║   ██║",
			" ███████║   ██║   ██║  ██║██║  ██║   ██║   ╚██████╔╝",
			" ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ",
		}

		-- Buttons (ordered by frequency of use)
		dashboard.section.buttons.val = {
			dashboard.button("f", "  Find File", "<cmd>Telescope find_files<cr>"),
			dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<cr>"),
			dashboard.button("g", "  Find Word", "<cmd>Telescope live_grep<cr>"),
			dashboard.button("e", "  New File", "<cmd>ene<cr>"),
			dashboard.button("-", "  File Explorer", "<cmd>Oil<cr>"),
			dashboard.button("c", "  Config", "<cmd>e ~/.config/nvim/init.lua<cr>"),
			dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
			dashboard.button("m", "  Mason", "<cmd>Mason<cr>"),
			dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
		}

		-- Highlights
		dashboard.section.header.opts.hl = "Type"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "Comment"

		-- Footer: plugins loaded + startup time
		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val = "  "
					.. stats.loaded
					.. " / "
					.. stats.count
					.. " plugins loaded in "
					.. ms
					.. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		alpha.setup(dashboard.opts)

		-- Cleaner alpha buffer
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt_local.foldenable = false
				vim.opt_local.cursorline = false
			end,
		})
	end,
}
