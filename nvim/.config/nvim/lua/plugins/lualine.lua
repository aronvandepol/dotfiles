-- Define the configuration for lualine
local lualine_config = {
  options = {
    component_separators = "",
    section_separators = "",
    theme = "auto", -- Use colors defined by your colorscheme
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Function to insert components into left section (lualine_c)
local function ins_left(component) table.insert(lualine_config.sections.lualine_c, component) end

-- Function to insert components into right section (lualine_x)
local function ins_right(component) table.insert(lualine_config.sections.lualine_x, component) end

-- Insert components into left section (lualine_c)
ins_left {
  function() return "▊" end,
  padding = { left = 0, right = 1 },
}

ins_left {
  "mode",
}

ins_left {
  "filename",
}

ins_left { "location" }

ins_left { "diagnostics", sources = { "nvim_diagnostic" } }

ins_left {
  function() return "%=" end,
}

ins_left {
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return client.name end
    end
    return msg
  end,
  icon = nil, -- Remove icon
}

-- Insert components into right section (lualine_x)
ins_right {
  "o:encoding",
}

ins_right {
  "fileformat",
  icons_enabled = false, -- Remove icons
}

ins_right {
  "branch",
}

ins_right {
  "diff",
}

ins_right {
  function() return "▊" end,
  padding = { left = 1 },
}

-- Load lualine with the defined configuration
return {
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = function() require("lualine").setup(lualine_config) end },
  {
    "rebelot/heirline.nvim",
    optional = true,
    config = function(_, opts) opts.statusline = nil end,
  },
}
