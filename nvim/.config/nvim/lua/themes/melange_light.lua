-- Thanks to https://github.com/savq/melange for existing
-- This is a modified version of it
local M = {}

M.base_30 = {
    white = "#54433A",
    darker_black = "#E9E1DB",
    black = "#F1F1F1", -- nvim bg
    black2 = "#E9E1DB",
    one_bg = "#E4DCD6",
    one_bg2 = "#DDD5CF",
    one_bg3 = "#D6CEC8",
    grey = "#CFC7C1",
    grey_fg = "#C8C0BA",
    grey_fg2 = "#C1B9B3",
    light_grey = "#BAB2AC",
    red = "#BF0021",
    baby_pink = "#C77B8B",
    pink = "#BF0021",
    line = "#E4DCD6", -- for lines like vertsplit
    green = "#3A684A",
    vibrant_green = "#6E9B72",
    nord_blue = "#465AA4",
    blue = "#7892BD",
    yellow = "#A06D00",
    sun = "#BC5C00",
    purple = "#904180",
    dark_purple = "#BE79BB",
    teal = "#3D6568",
    orange = "#A06D00",
    firered = "#BF0021",
    cyan = "#739797",
    statusline_bg = "#E9E1DB",
    lightbg = "#DDD5CF",
    pmenu_bg = "#3A684A",
    folder_bg = "#3D6568",
}

M.base_16 = {
    base00 = "#F1F1F1",
    base01 = "#E4DCD6",
    base02 = "#DDD5CF",
    base03 = "#D6CEC8",
    base04 = "#CFC7C1",
    base05 = "#54433A",
    base06 = "#4D3C33",
    base07 = "#46352C",
    base08 = "#54433A",
    base09 = "#3A684A",
    base0A = "#6E9B72",
    base0B = "#7892BD",
    base0C = "#BC5C00",
    base0D = "#BC5C00",
    base0E = "#A06D00",
    base0F = "#7D6658",
}

M.type = "light"

M.polish_hl = {
    ["@variable.member"] = { fg = M.base_30.white },
    ["@variable.member.key"] = { fg = M.base_30.white },
    ["@function.macro"] = {
        fg = M.base_30.vibrant_green,
    },
    Include = {
        fg = M.base_30.vibrant_green,
    },
    Operator = {
        fg = M.base_30.firered,
    },
    Boolean = {
        fg = M.base_30.purple,
    },
}

M = require("base46").override_theme(M, "melange_light")

return M
