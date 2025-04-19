---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "go",
      "gomod",
      "gosum",
      "bash",
      "make",
      "yaml",
      "markdown",
      "markdown_inline",
      "lua",
      "vim",
      "query",
    },
  },
}
