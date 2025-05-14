---@type LazySpec
return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    {
      "fredrikaverpil/neotest-golang",
      dependencies = {
        "leoluz/nvim-dap-go",
        opts = {},
      },
      branch = "main",
    },
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "andythigpen/nvim-coverage",
  },
  opts = function(_, opts)
    opts.adapters = {
      require("neotest-golang")({
        dap = { justMyCode = false },
        go_test_args = {
          "-v",
          "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
        },
      }),
    }

    opts.log_level = vim.log.levels.DEBUG
  end,
  config = function(_, opts)
    local neotest = require("neotest")
    local core = require("astrocore")

    neotest.setup(opts)

    local leader = "<leader>"
    core.set_mappings({
      n = {
        [leader .. "T"] = { desc = "Test" },
        [leader .. "TA"] = { function() neotest.run.attach() end, desc = "Attach" },
        [leader .. "Ta"] = {
          function() neotest.run.run(vim.fn.getcwd()) end,
          desc = "All files",
        },
        [leader .. "TD"] = {
          function() neotest.run.run({ vim.fn.expand("%"), strategy = "dap", suite = false }) end,
          desc = "Debug current file",
        },
        [leader .. "Td"] = {
          function() neotest.run.run({ strategy = "dap", suite = false }) end,
          desc = "Debug nearest test",
        },
        [leader .. "Tf"] = { function() neotest.run.run(vim.fn.expand("%")) end, desc = "Current file" },
        [leader .. "Tn"] = { function() neotest.run.run() end, desc = "Nearest" },
        [leader .. "TO"] = { function() neotest.output_panel.toggle() end, desc = "Toggle output" },
        [leader .. "To"] = {
          function() neotest.output.open({ enter = true, auto_close = true }) end,
          desc = "Output",
        },
        [leader .. "Tr"] = { function() neotest.run.run_last() end, desc = "Rerun" },
        [leader .. "TS"] = { function() neotest.summary.toggle() end, desc = "Toggle summary" },
        [leader .. "Ts"] = { function() neotest.run.run({ suite = true }) end, desc = "Suite" },
        [leader .. "Tt"] = { function() neotest.run.stop() end, desc = "Terminate" },
      },
    })
  end,
}
