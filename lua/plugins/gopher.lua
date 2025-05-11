---@type LazySpec
return {
  "olexsmir/gopher.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "williamboman/mason.nvim", optional = true },
  },

  ft = "go",
  build = function()
    if not require("lazy.core.config").spec.plugins["mason.nvim"] then
      vim.print("Installing go dependencies...")
      vim.cmd.GoInstallDeps()
    end
  end,
  opts = {},
}
