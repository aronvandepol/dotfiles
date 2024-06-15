return {

  {
    "quarto-dev/quarto-nvim",
    dev = false,
    dependencies = {
      {
        "jmbuhr/otter.nvim",
        dev = false,
        dependencies = {
          { "neovim/nvim-lspconfig" },
        },
        opts = {
          lsp = {
            hover = {
              border = require("misc.style").border,
            },
          },
          buffers = {
            -- if set to true, the filetype of the otterbuffers will be set.
            -- otherwise only the autocommand of lspconfig that attaches
            -- the language server will be executed without setting the filetype
            set_filetype = true,
          },
        },
      },
    },
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "lua", "html", "dot" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    tag = nil,
    branch = "master",
    run = ":TSUpdate",
    config = function()
      require("quarto").setup({
        debug = false,
        closePreviewOnExit = true,
        lspFeatures = {
          enabled = true,
          chunks = "curly",
          languages = { "r", "python", "julia", "bash", "html" },
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        codeRunner = {
          enabled = false,
          default_method = nil, -- 'molten' or 'slime'
          ft_runners = {},   -- filetype to runner, ie. `{ python = "molten" }`.
          -- Takes precedence over `default_method`
          never_run = { "yaml" }, -- filetypes which are never sent to a code runner
        },
        keymap = {
          -- set whole section or individual keys to `false` to disable
          hover = "K",
          definition = "gd",
          type_definition = "gD",
          rename = "<leader>lR",
          format = "<leader>lf",
          references = "gr",
          document_symbols = "gS",
        },
      })
    end,
  },
}

