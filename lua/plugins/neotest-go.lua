---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-go",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function(_, opts)
    local core = require "astrocore"
    local neotest = require "neotest"

    opts.adapters = opts.adapters or {}
    table.insert(
      opts.adapters,
      require "neotest-go" {
        args = { "-coverprofile=" .. vim.fn.getcwd() .. "coverage.out" },
        experimental = {
          test_table = true,
        },
      }
    )

    local leader = "<leader>"
    core.set_mappings {
      n = {
        [leader .. "T"] = { desc = "Test" },
        [leader .. "TA"] = { function() neotest.run.attach() end, desc = "Attach" },
        [leader .. "Ta"] = { function() neotest.run(vim.uv.cwd()) end, desc = "All files" },
        [leader .. "TD"] = {
          function() neotest.run.run { vim.fn.expand "%", strategy = "dap", suite = false } end,
          desc = "Debug current file",
        },
        [leader .. "Td"] = {
          function() neotest.run.run { strategy = "dap", suite = false } end,
          desc = "Debug nearest test",
        },
        [leader .. "Tf"] = { function() neotest.run.run(vim.fn.expand "%") end, desc = "Current file" },
        [leader .. "Tn"] = { function() neotest.run.run() end, desc = "Nearest" },
        [leader .. "TO"] = { function() neotest.output_panel.toggle() end, desc = "Toggle output" },
        [leader .. "To"] = { function() neotest.output.open { enter = true, auto_close = true } end, desc = "Output" },
        [leader .. "Tr"] = { function() neotest.run.run_last() end, desc = "Rerun" },
        [leader .. "TS"] = { function() neotest.summary.toggle() end, desc = "Toggle summary" },
        [leader .. "Ts"] = { function() neotest.run.run { suite = true } end, desc = "Suite" },
        [leader .. "Tt"] = { function() neotest.run.stop() end, desc = "Terminate" },
      },
    }
  end,
}
