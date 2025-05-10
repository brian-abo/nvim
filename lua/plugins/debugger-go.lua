---@type LazySpec
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "leoluz/nvim-dap-go",
    },
    config = function()
      local core = require "astrocore"
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      require("dap-go").dapgo.setup()

      require("mason-nvim-dap").setup {
        ensure_installed = { "delve" },
        automatic_installation = false,
      }

      local leader = "<leader>"
      core.set_mappings {
        n = {
          [leader .. "D"] = { desc = "Debug" },
          [leader .. "Db"] = { function() dap.toggle_breakpoint() end, desc = "Toggle breakpoint" },
          [leader .. "Dc"] = { function() dap.continue() end, desc = "Continue" },
          [leader .. "DC"] = { function() dap.run_to_cursor() end, desc = "Run to cursor" },
          [leader .. "Dg"] = { function() dap.goto_() end, desc = "Go to line" },
          [leader .. "Do"] = { function() dap.step_over() end, desc = "Step over" },
          [leader .. "DO"] = { function() dap.step_out() end, desc = "Step out" },
          [leader .. "Di"] = { function() dap.step_into() end, desc = "Step into" },
          [leader .. "Dj"] = { function() dap.down() end, desc = "Jump down" },
          [leader .. "Dk"] = { function() dap.up() end, desc = "Jump up" },
          [leader .. "Dr"] = { function() dap.run_last() end, desc = "Rerun" },
          [leader .. "DR"] = { function() dap.repl.toggle() end, desc = "REPL" },
          [leader .. "Dp"] = { function() dap.pause() end, desc = "Pause" },
          [leader .. "Dx"] = { function() dap.clear_breakpoints() end, desc = "Clear breakpoints" },
          [leader .. "Ds"] = { function() dap.session() end, desc = "Session" },
          [leader .. "Dt"] = { function() dap.terminate() end, desc = "Terminate" },
          [leader .. "Dw"] = { function() dap.hover() end, desc = "Widgets" },
          [leader .. "Du"] = { function() dapui.toggle {} end, "Toggle UI" },
          [leader .. "De"] = { function() dapui.eval() end, "Evaluate" },
        },
      }
    end,
  },
  { "theHamsta/nvim-dap-virtual-text", opts = {} },
}
