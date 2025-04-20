-- Customize None-ls sources
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  event = "BufReadPre",
  opts = function(_, opts)
    local null_ls = require "null-ls"

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Lua
      null_ls.builtins.formatting.stylua.with { filetypes = { "lua" } },

      -- YAML
      null_ls.builtins.diagnostics.yamllint.with { filetypes = { "yaml" } },
      null_ls.builtins.formatting.prettier.with { filetypes = { "yaml" } },

      -- Markdown
      null_ls.builtins.diagnostics.markdownlint.with { filetypes = { "markdown" } },
      null_ls.builtins.formatting.prettier.with { filetypes = { "markdown" } },

      -- Bash / Shell
      null_ls.builtins.formatting.shfmt.with { filetypes = { "sh", "bash", "zsh" } },

      -- Makefiles
      null_ls.builtins.diagnostics.checkmake.with { filetypes = { "make" } },
    })
  end,
}

