---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua-language-server",
        "gopls",
        "gomodifytags",
        "gotests",
        "iferr",
        "impl",
        "goimports",
        "delve",
        "tree-sitter-cli",
      },
    },
  },
}
