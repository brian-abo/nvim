---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-go",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}
    table.insert(
      opts.adapters,
      require "neotest-go" {
        experimental = {
          test_table = true,
        },
      }
    )
  end,
}
