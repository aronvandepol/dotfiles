local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- list of all servers configured.
lspconfig.servers = {
    "lua_ls",
    "pyright",
    "ruff_lsp",
    "texlab",
    "marksman",
    "yamlls",
    "ltex",
}

-- list of servers configured with default config.
local default_servers = {
    "pyright",
    "ruff_lsp",
    "marksman",
    "ltex",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- lspconfig.clangd.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
-- })

-- lspconfig.gopls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gotmpl", "gowork" },
--     root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             analyses = {
--                 unusedparams = true,
--             },
--             completeUnimported = true,
--             usePlaceholders = true,
--             staticcheck = true,
--         },
--     },
-- })

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern(
        "~/.local/share/nvim/lazy/nvim-lspconfig/.luarc.json",
        "~/.local/share/nvim/lazy/nvim-lspconfig/.luarc.jsonc",
        "~/.local/share/nvim/lazy/nvim-lspconfig/.luacheckrc",
        "~/.local/share/nvim/lazy/nvim-lspconfig/.stylua.toml",
        "~/.local/share/nvim/lazy/nvim-lspconfig/stylua.toml",
        "~/.local/share/nvim/lazy/nvim-lspconfig/selene.toml",
        "~/.local/share/nvim/lazy/nvim-lspconfig/selene.yml",
        "~/.local/share/nvim/lazy/nvim-lspconfig/.git"
    ),
    settings = {
        Lua = {
            diagnostics = {
                enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

-- Ruff LSP configuration
lspconfig.ruff_lsp.setup({
    on_attach = function(client, bufnr)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

-- Pyright configuration
lspconfig.pyright.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off", -- Disable type checking in favor of Ruff
            },
        },
    },
})

-- TexLab configuration
lspconfig.texlab.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {
                onSave = true,
            },
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false,
            },
        },
    },
})

-- YAML Language Server configuration
lspconfig.yamlls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
                -- Add more schemas as needed
            },
            validate = true,
            completion = true,
            hover = true,
        },
    },
})

-- LTEX
local home = vim.fn.expand("$HOME")
local dictionary_path = home .. "/.config/nvim/ltex_custom_dictionary.txt" -- Adjust this path as needed

local words = {}

for word in io.open(dictionary_path, "r"):lines() do
    table.insert(words, word)
end

lspconfig.ltex.setup({
    on_attach = function(client, bufnr)
        -- Your existing on_attach logic here
        print("LTeX attached to buffer: " .. bufnr)
    end,
    capabilities = capabilities,
    filetypes = { "latex", "tex", "bib", "markdown", "quarto" },
    settings = {
        ltex = {
            enabled = { "latex", "tex", "bib", "markdown", "quarto" },
            language = "en-GB",
            diagnosticSeverity = "information",
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "en-GB",
            },
            disabledRules = {
                ["en-GB"] = { "ARROWS" },
            },
            dictionary = {
                ["en-GB"] = words,
            },
        },
    },
})
