---@type ChadrcConfig
local autocmd = vim.api.nvim_create_autocmd

local M = {}

M.ui = {
    -- set theme
    -- hl_add = {},
    -- hl_override = {},
    -- changed_themes = {},
    -- theme_toggle = { "melange_light", "melange_light" },
    -- theme = "melange_light", -- default theme
    nvdash = {
        load_on_startup = true,
    },
    -- highlight on yank
    autocmd("TextYankPost", {
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch",
                timeout = 100,
            })
        end,
    }),
    -- hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    -- },
}

return M
