return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-dap.nvim" },
    {
      "jmbuhr/telescope-zotero.nvim",
      enabled = true,
      dev = false,
      dependencies = {
        { "kkharji/sqlite.lua" },
      },
      config = function()
        local function locate_bib()
          local function file_exists(path)
            local f = io.open(path, "r")
            if f then
              io.close(f)
              return true
            else
              return false
            end
          end

          local current_file = vim.fn.expand "%:p"
          local current_dir = vim.fn.expand "%:p:h"
          local parent_dir = vim.fn.fnamemodify(current_dir, ":h")

          local bib_file = current_dir .. "/bibliography.bib"
          if file_exists(bib_file) then return bib_file end

          bib_file = parent_dir .. "/bibliography.bib"
          if file_exists(bib_file) then return bib_file end

          return nil
        end

        require("telescope").setup {
          extensions = {
            zotero = {
              ft = {
                default = {
                  insert_key_formatter = function(citekey) return citekey end,
                  locate_bib = locate_bib,
                },
              },
            },
          },
        }
        require("telescope").load_extension "zotero"
      end,
    },
  },
  keys = {
    -- Zotero keymaps
    { "<Leader>fz", ":Telescope zotero<cr>", desc = "[z]otero" },
    { "<C-x>", "<cmd>stopinsert<cr>:Telescope zotero<cr>", mode = "i", desc = "Zotero (insert mode)" },
  },
}
