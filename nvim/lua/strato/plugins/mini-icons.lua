-- mini.icons: faster, cached icon provider (replaces nvim-web-devicons)
-- The mock_nvim_web_devicons lets legacy plugins keep working transparently.
return {
	"nvim-mini/mini.icons",
	lazy = false,
	priority = 2000,
	version = "*",
	opts = {
		style = "glyph",
	},
	init = function()
		-- Mock nvim-web-devicons so plugins depending on it use mini.icons instead
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
}
