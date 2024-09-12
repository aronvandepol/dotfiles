require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--
local home = vim.fn.expand("$HOME")
local dictionary_path = home .. "/.config/nvim/ltex_custom_dictionary.txt"
function AddWordToDictionary()
    local word = vim.fn.expand("<cword>")
    local lower_word = word:lower()
    local capitalized_word = lower_word:gsub("^%l", string.upper)

    local file = io.open(dictionary_path, "a")
    if file then
        if word == lower_word then
            -- Word is not capitalized, add both forms
            file:write(lower_word .. "\n")
            file:write(capitalized_word .. "\n")
            print("Added '" .. lower_word .. "' and '" .. capitalized_word .. "' to custom dictionary")
        else
            -- Word is capitalized, add both forms
            file:write(word .. "\n")
            file:write(lower_word .. "\n")
            print("Added '" .. word .. "' and '" .. lower_word .. "' to custom dictionary")
        end
        file:close()

        -- Reload the dictionary
        local dict = vim.split(vim.fn.join(vim.fn.readfile(dictionary_path), "\n"), "\n", { trimempty = true })
        vim.lsp.buf_notify(
            0,
            "workspace/didChangeConfiguration",
            { settings = { ltex = { dictionary = { ["en-GB"] = dict } } } }
        )
    else
        print("Error: Could not open dictionary file")
    end
end
-- Add a keybinding to call this function
vim.api.nvim_set_keymap("n", "<leader>la", ":lua AddWordToDictionary()<CR>", { noremap = true, silent = true })
