return {
	{
		"hrsh7th/nvim-cmp",
		branch = "main",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip",
			"f3fora/cmp-spell",
			"ray-x/cmp-treesitter",
			"kdheepak/cmp-latex-symbols",
			"jmbuhr/cmp-pandoc-references",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })
			luasnip.filetype_extend("quarto", { "markdown" })
			luasnip.filetype_extend("rmarkdown", { "markdown" })
			local lspkind = require("lspkind")
			lspkind.init()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-f>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
					["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "spell" },
					{ name = "treesitter" },
					{ name = "calc" },
					{ name = "latex_symbols" },
					{ name = "emoji" },
					{ name = "pandoc_references" },
					{ name = "otter" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							buffer = "[buf]",
							nvim_lsp = "[LSP]",
							luasnip = "[snip]",
							path = "[path]",
							calc = "[calc]",
							emoji = "[emoji]",
							spell = "[spell]",
							pandoc_references = "[ref]",
							tags = "[tag]",
							treesitter = "[TS]",
							latex_symbols = "[tex]",
							otter = "[🦦]", -- Assuming 'otter' is a custom source or an example
						},
					}),
				},
			})
		end,
	},
	-- Add other plugins as necessary
}
