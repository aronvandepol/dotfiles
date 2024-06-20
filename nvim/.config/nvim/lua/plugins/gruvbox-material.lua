return {
  "sainnhe/gruvbox-material",
  name = "gruvbox-material",
  opts = {
    setup = function()
      if vim.fn.has "termguicolors" then vim.o.termguicolors = true end

      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_cursor = "auto"
    end,
    on_config_done = function()
      vim.cmd "colorscheme gruvbox-material"
      vim.g.lightline = { colorscheme = "gruvbox_material" }
    end,
  },
}
