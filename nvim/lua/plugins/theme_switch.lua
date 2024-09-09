-- Auto switches dark and light themes based in the chadrc.lua toggle.
return {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    config = function()
        require("auto-dark-mode").setup({
            update_interval = 1000,
        })
    end,
}
