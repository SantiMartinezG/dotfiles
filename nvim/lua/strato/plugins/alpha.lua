return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set the header with ASCII art
			dashboard.section.header.val = {

				" ███████╗████████╗██████╗  █████╗ ████████╗ ██████╗ ",
				" ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗",
				" ███████╗   ██║   ██████╔╝███████║   ██║   ██║   ██║",
				" ╚════██║   ██║   ██╔══██╗██╔══██║   ██║   ██║   ██║",
				" ███████║   ██║   ██║  ██║██║  ██║   ██║   ╚██████╔╝",
				" ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ",
			}

			-- Configure the dashboard menu buttons
			dashboard.section.buttons.val = {
				dashboard.button("e", " " .. " New File", "<cmd> ene <cr>"),
				dashboard.button("SPC ee", " " .. " Toggle file explorer", "<cmd> NvimTreeToggle <cr>"),
				dashboard.button("SPC ff", "󰱼 " .. " Find File", "<cmd> Telescope find_files <cr>"),
				dashboard.button("SPC fs", " " .. " Find Word", "<cmd> Telescope live_grep <cr>"),
				dashboard.button("m", " " .. " Mason", "<cmd> Mason <cr>"),
				dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
				dashboard.button("q", " " .. " Quit NVIM", "<cmd> qa <cr>"),
			}

			-- Apply the dashboard configuration
			alpha.setup(dashboard.opts)

			-- Disable folding on the alpha buffer for better visibility
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},
}
