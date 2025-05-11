local function selene_configured(path)
  return #vim.fs.find("selene.toml", { path = path, upward = true, type = "file" }) > 0
end

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
      local null_ls = require("null-ls")

      return {
        sources = require("astrocore").list_insert_unique({}, {
          -- Lua
          null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" } }),

          -- YAML
          null_ls.builtins.diagnostics.yamllint.with({ filetypes = { "yaml" } }),
          null_ls.builtins.formatting.prettier.with({ filetypes = { "yaml" } }),

          -- Markdown
          null_ls.builtins.diagnostics.markdownlint.with({ filetypes = { "markdown" } }),
          null_ls.builtins.formatting.prettier.with({ filetypes = { "markdown" } }),

          -- Bash / Shell
          null_ls.builtins.formatting.shfmt.with({ filetypes = { "sh", "bash", "zsh" } }),

          -- Makefiles
          null_ls.builtins.diagnostics.checkmake.with({ filetypes = { "make" } }),
        }),
      }
    end,
    config = function(_, opts)
      require("mason").setup()

      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua",
          "selene",
          "goimports",
          "gofumpt",
        },
        automatic_installation = false,
        handlers = {},
      })

      require("null-ls").setup(opts)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", lsp_format = "last" },
        lua = { "stylua" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        lua = { "selene" },
      },
      linters = {
        selene = { condition = function(ctx) return selene_configured(ctx.filename) end },
      },
    },
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = {
      file = {
        [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      filetype = {
        gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
      },
    },
  },
}
