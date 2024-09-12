-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Function to get the appearance
function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return "Dark"
end

-- Function to select color scheme based on appearance
function scheme_for_appearance(appearance)
    if appearance:find("Dark") then
        return "melange_dark"
    else
        return "melange_light"
    end
end

-- Set color scheme
config.color_scheme = scheme_for_appearance(get_appearance())

-- Apply config choices
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.window_padding = {
    left = 15,
    right = 5,
    top = 0,
    bottom = 0,
}

-- Set font
config.font = wezterm.font_with_fallback({
    "MonaspiceAr Nerd Font Mono",
    "Source Han Mono K",
})
config.font_size = 14

-- Setting the Image Protocol
config.enable_kitty_graphics = true

-- Return the configuration to wezterm
return config
