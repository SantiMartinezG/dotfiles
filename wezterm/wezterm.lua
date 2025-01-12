-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

-- Tab
config.enable_tab_bar = false

-- Window
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.90

-- Colorscheme
config.colors = {
    foreground = "#EEE8D5",
    background = "#00141a",
    cursor_bg = "#49AEF5",
    cursor_border = "#49AEF5",
    cursor_fg = "#00141a",
    selection_bg = "#0a4a5b",
    selection_fg = "#EEE8D5",
    ansi = {
        "#00141a",
        "#dc322f",
        "#859900",
        "#b58900",
        "#268BD2",
        "#d33682",
        "#2AA198",
        "#EEE8D5"
    },
    brights = {
        "#073642",
        "#F6524F",
        "#BAFB00",
        "#FFC100",
        "#49AEF5",
        "#F255A1",
        "#29EEDF",
        "#FDF6E3"
    },
}

-- and finally, return the configuration to wezterm
return config
