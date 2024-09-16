require("nvchad.options")

local o = vim.o

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
vim.opt.relativenumber = true

o.cursorlineopt = "both" -- to enable cursorline!

vim.api.nvim_create_autocmd(
	{ "FocusLost", "ModeChanged", "TextChanged", "BufEnter" },
	{ desc = "autosave", pattern = "*", command = "silent! update" }
)

vim.opt.undofile = true

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if a directory was passed as an argument
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
      -- Change to the directory
      vim.cmd.cd(vim.fn.argv(0))
      -- Open nvim-tree
      require("nvim-tree.api").tree.open()
    end
  end
})
