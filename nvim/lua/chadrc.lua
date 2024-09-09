---@type ChadrcConfig
local M = {}

M.ui = {
    hl_add = {},
    hl_override = {},
    changed_themes = {},
    theme_toggle = { "melange_light", "melange_light" },
    theme = "melange_light", -- default theme
    nvdash = {
        load_on_startup = true,
    },
    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

return M
