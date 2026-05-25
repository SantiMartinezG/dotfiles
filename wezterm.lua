-- === Wezterm Configuration ===

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- === Font Settings ===
config.font = wezterm.font("PlemolJP Console NF", { weight = "Regular" })
config.font_size = 16.0
config.line_height = 1.0
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.warn_about_missing_glyphs = false
config.adjust_window_size_when_changing_font_size = false

config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("PlemolJP Console NF", { weight = "Bold", style = "Italic" }),
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("PlemolJP Console NF", { weight = "Bold" }),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font("PlemolJP Console NF", { style = "Italic" }),
	},
}

-- === Rendering ===
config.front_end = "OpenGL"

-- === Wayland ===
config.enable_wayland = true

-- === Terminal ===
config.term = "xterm-256color"

-- === Cursor ===
config.default_cursor_style = "SteadyBlock"
config.cursor_thickness = 2
config.underline_thickness = 2
config.underline_position = -3

-- === Window ===
config.enable_tab_bar = false
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE"

-- === Colors ===
config.colors = {
	foreground = "#EDE7D4",
	background = "#00141A",
	cursor_bg = "#47ADF5",
	cursor_border = "#47ADF5",
	cursor_fg = "#00141A",
	selection_bg = "#103956",
	selection_fg = "#EDE7D4",
	ansi = {
		"#00141A",
		"#DC312E",
		"#859900",
		"#B28600",
		"#278BD3",
		"#D33682",
		"#2AA298",
		"#EDE7D4",
	},
	brights = {
		"#073541",
		"#F65351",
		"#B7FA00",
		"#FFBF00",
		"#47ADF5",
		"#F254A1",
		"#2BEEDE",
		"#FDF6E2",
	},
}

-- === Performance ===
config.animation_fps = 60
config.max_fps = 120
config.scrollback_lines = 10000

-- === Shell ===
config.default_prog = { "/usr/bin/fish", "-l" }
config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_duration_ms = 75,
	fade_out_duration_ms = 75,
	target = "CursorColor",
}

-- === Behavior ===
config.automatically_reload_config = true
config.hide_mouse_cursor_when_typing = true
config.check_for_updates = false
config.bypass_mouse_reporting_modifiers = "SHIFT"

return config
