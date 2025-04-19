---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- LSP
        "lua-language-server",
        "gopls",

        -- Formatters
        "stylua",
        "goimports",
        "gofumpt",

        -- Debuggers
        "delve",

        -- Diagnostics
        "shellcheck",

        -- Other
        "tree-sitter-cli",
      },
    },
  },
}
