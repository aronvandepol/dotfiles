return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    name = "gruvbox",
    priority = 1000,
    config = function()
      -- Set the Gruvbox Material theme
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_cursor = "auto"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  -- color html colors
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        names = true,    -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = false,  -- CSS rgb() and rgba() functions
        hsl_fn = false,  -- CSS hsl() and hsla() functions
        css = false,     -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false,  -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = false,                           -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false,
        -- all the sub-options of filetypes apply to buftypes
      },
      buftypes = {},
    },
  },
}
