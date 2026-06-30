-- ~/.config/wezterm/wezterm.lua
-- Fish + tmux + nvim | CachyOS | Solarized Osaka

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font("PlemolJP Console NF", { weight = "Regular" })
config.font_size = 16.0
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.adjust_window_size_when_changing_font_size = false

-- Wayland (KDE Plasma 6 native)
config.enable_wayland = true

-- Cursor
config.default_cursor_style = "SteadyBlock"

-- Window
config.enable_tab_bar = false
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE"

-- Colors (Solarized Osaka)
config.colors = {
	foreground = "#EDE7D4",
	background = "#00141A",
	cursor_bg = "#49AEF5",
	cursor_border = "#49AEF5",
	cursor_fg = "#00141A",
	selection_bg = "#103956",
	selection_fg = "#EDE7D4",
	ansi = {
		"#00141A",
		"#DC322F",
		"#859900",
		"#B58900",
		"#268BD2",
		"#D33682",
		"#2AA198",
		"#EDE7D4",
	},
	brights = {
		"#073642",
		"#F65351",
		"#B7FA00",
		"#FFBF00",
		"#49AEF5",
		"#F254A1",
		"#2BEEDE",
		"#FDF6E2",
	},
}

-- Performance
config.animation_fps = 60
config.max_fps = 120
config.scrollback_lines = 50000

-- Shell
config.default_prog = { "fish", "-l" }

-- Behavior
config.automatically_reload_config = true
config.hide_mouse_cursor_when_typing = true
config.check_for_updates = false
config.audible_bell = "Disabled"

return config
