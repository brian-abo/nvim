---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-go",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "andythigpen/nvim-coverage",
  },
  opts = function(_, opts)
    local core = require("astrocore")
    local neotest = require("neotest")
    local coverage = require("coverage")

    opts.adapters = opts.adapters or {}
    table.insert(
      opts.adapters,
      neotest({
        args = { "-coverprofile=" .. vim.fn.getcwd() .. "coverage.out" },
        experimental = {
          test_table = true,
        },
      })
    )

    opts.log_level = vim.log.levels.DEBUG
    neotest.setup(opts)
    coverage.setup({ auto_reload = true })

    local leader = "<leader>"
    core.set_mappings({
      n = {
        [leader .. "T"] = { desc = "Test" },
        [leader .. "TA"] = { function() neotest.run.attach() end, desc = "Attach" },
        [leader .. "Ta"] = {
          function()
            print("Calling neotest.run.run with cwd:", vim.uv.cwd())
            neotest.run(vim.uv.cwd())
          end,
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
        [leader .. "Tn"] = { function() neotest.run() end, desc = "Nearest" },
        [leader .. "TO"] = { function() neotest.output_panel.toggle() end, desc = "Toggle output" },
        [leader .. "To"] = {
          function() neotest.output.open({ enter = true, auto_close = true }) end,
          desc = "Output",
        },
        [leader .. "Tr"] = { function() neotest.run.run_last() end, desc = "Rerun" },
        [leader .. "TS"] = { function() neotest.summary.toggle() end, desc = "Toggle summary" },
        [leader .. "Ts"] = { function() neotest.run.run({ suite = true }) end, desc = "Suite" },
        [leader .. "Tt"] = { function() neotest.run.stop() end, desc = "Terminate" },
        [leader .. "C"] = { desc = "Toggle coverage" },
        [leader .. "Ct"] = {
          function()
            coverage.load(true)
            coverage.toggle()
          end,
          desc = "Toggle",
        },
        [leader .. "Cx"] = { function() coverage.clear() end, desc = "Clear" },
        [leader .. "Cs"] = { function() coverage.summary() end, desc = "Summary" },
      },
    })
  end,
}
