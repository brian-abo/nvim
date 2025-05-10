---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
    event = "VeryLazy",
    opts = function()
      local null_ls = require "null-ls"

      return {
        sources = require("astrocore").list_insert_unique({}, {
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
        }),
      }
    end,
    config = function(_, opts)
      require("mason").setup()

      require("mason-null-ls").setup {
        ensure_installed = {
          "stylua",
          "selene",
          "goimports",
          "gofumpt",
        },
        automatic_installation = false,
        handlers = {},
      }

      require("null-ls").setup(opts)
    end,
  },
}
