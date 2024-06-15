vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "BufRead", "BufNewFile"}, {
  pattern = {"*.tex", "*.md", "*.qmd"},
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.list = false
  end,
})


-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

local opt=vim.opt
opt.number=true
opt.relativenumber=true

opt.scrolloff=5
opt.sidescrolloff=5

opt.hlsearch=true
opt.incsearch=true

opt.mouse:append('a')
opt.clipboard:append('unnamedplus')

opt.tabstop=2
opt.shiftwidth=2
opt.expandtab=true
opt.autoindent=true

opt.ignorecase=true
opt.smartcase=true

opt.swapfile=false
opt.autoread=true
vim.bo.autoread=true

opt.cursorline=true
opt.termguicolors=true


vim.api.nvim_create_autocmd('TextYankPost', {
	callback=function()
		vim.highlight.on_yank({
			higroup="IncSearch",
			timeout=300
		})
	end
})

vim.g.gruvbox_diagnostic_line_highlight = 1

vim.g.everforest_diagnostic_line_highlight = 1

vim.fn.sign_define({
  {
    name = 'DiagnosticSignError',
    text = '',
    texthl = 'DiagnosticSignError',
    linehl = 'ErrorLine'
  },
  {
    name = 'DiagnosticSignWarn',
    text = '',
    texthl = 'DiagnosticSignWarn',
    linehl = 'WarningLine'
  },
  {
    name = 'DiagnosticSignInfo',
    text = '',
    texthl = 'DiagnosticSignInfo',
    linehl = 'InfoLine'
  },
  {
    name = 'DiagnosticSignHint',
    text = '',
    texthl = 'DiagnosticSignHint',
    linehl = 'HintLine'
  },
})

