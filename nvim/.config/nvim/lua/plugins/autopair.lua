return {
  "windwp/nvim-autopairs",
  config = function()
    require('nvim-autopairs').setup{}

    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')

    -- Adding rules for markdown and qmd for *
    npairs.add_rule(Rule("*", "*", "markdown"))
    npairs.add_rule(Rule("*", "*", "quarto"))

  end,
}
