---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    event = "VeryLazy",
    opts = function()
      return {
        sources = {
          -- Anything not available via Mason
          -- e.g., null_ls.builtins.formatting.some_custom_tool,
        },
      }
    end,
    config = function(_, opts)
      require("mason").setup()

      -- Then configure mason-null-ls
      require("mason-null-ls").setup {
        -- Mason supported formatters
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
