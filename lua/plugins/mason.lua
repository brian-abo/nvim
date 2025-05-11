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
        "delve",
        "tree-sitter-cli",
      },
      auto_update = true,
      run_on_start = true,
    },
  },
}
