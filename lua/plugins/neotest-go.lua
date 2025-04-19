---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-go",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function(_, opts)
    local core = require("astrocore")
    local neotest = require("neotest")

    opts.adapters = opts.adapters or {}
    table.insert(
      opts.adapters,
      require "neotest-go" {
        experimental = {
          test_table = true,
        },
      }
    )

    local leader = "<Leader>"
    core.set_mappings({
      n = {
        [leader .. "T"] = { desc = "Test (neotest)" },
        [leader .. "Tt"] = { function() neotest.run.run() end, desc = "Test near cursor" },
        [leader .. "Tf"] = { function() neotest.run.run(vim.fn.expand "%") end, desc = "Test current file" },
        [leader .. "To"] = { function() neotest.output_panel.toggle() end, desc = "Toggle output panel" },
        [leader .. "Ts"] = { function() neotest.summary.toggle() end, desc = "Toggle test summary" },
      },
    })
  end,
}
