-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Font
config.font = wezterm.font("IosevkaTerm Nerd Font")
config.font_size = 14

-- Tab
config.enable_tab_bar = false

-- Window
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.90

-- Colorscheme
config.color_scheme = "Tokyo Night"

-- and finally, return the configuration to wezterm
return config
