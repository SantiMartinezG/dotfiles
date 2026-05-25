return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	priority = 1200,
	dependencies = {
		"nvim-mini/mini.icons",
		"craftzdog/solarized-osaka.nvim",
	},
	opts = function()
		local colors = require("solarized-osaka.colors").setup()
		return {
			highlight = {
				groups = {
					InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
					InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
				},
			},
			window = { margin = { vertical = 0, horizontal = 1 } },
			hide = { cursorline = true },
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end

				-- Use mini.icons native API (faster, cached)
				local icon, icon_hl = require("mini.icons").get("file", filename)
				local modified = vim.bo[props.buf].modified and "●" or ""

				return {
					{ icon, group = icon_hl },
					{ " " },
					{ filename, gui = modified ~= "" and "bold,italic" or "bold" },
					{ modified, guifg = colors.yellow },
				}
			end,
		}
	end,
}
