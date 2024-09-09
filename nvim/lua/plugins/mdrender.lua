return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    file_types = { "markdown", "quarto" },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim", -- adjust this to use either mini.nvim suite or standalone plugins
    -- "echasnovski/mini.icons" -- uncomment this if using standalone mini plugins
    -- "nvim-tree/nvim-web-devicons" -- uncomment this if using nvim-web-devicons
  },
}
