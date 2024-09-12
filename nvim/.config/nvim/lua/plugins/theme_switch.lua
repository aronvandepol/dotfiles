-- Auto switches dark and light themes based in the chadrc.lua toggle.
return {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    opts = {
        update_interval = 1000,
        set_dark_mode = function()
            require("nvconfig").ui.theme = "melange"
            require("base46").load_all_highlights()
        end,
        set_light_mode = function()
            require("nvconfig").ui.theme = "melange_light"
            require("base46").load_all_highlights()
        end,
    },
}
