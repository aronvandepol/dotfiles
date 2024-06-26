return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
      vim.g.lightline = { colorscheme = "catppuccin_mocha" }
    end,
  },
}
