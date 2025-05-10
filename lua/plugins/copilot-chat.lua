---@type LazySpec
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = function(_, opts)
      local core = require "astrocore"
      local leader = "<leader>"

      opts.show_help = true

      core.set_mappings {
        n = {
          [leader .. "a"] = { desc = "AI Tools" },
          [leader .. "ao"] = { "<cmd>CopilotChatOpen<cr>", desc = "Open chat" },
          [leader .. "ac"] = { "<cmd>CopilotChatClose<cr>", desc = "Close chat" },
          [leader .. "at"] = { "<cmd>CopilotChatToggle<cr>", desc = "Toggle chat" },
          [leader .. "as"] = { "<cmd>CopilotChatStop<cr>", desc = "Stop current output" },
          [leader .. "ar"] = { "<cmd>CopilotChatReset<cr>", desc = "Reset chat window" },
          [leader .. "ap"] = { "<cmd>CopilotChatPrompts<cr>", desc = "View/select prompt templates" },
          [leader .. "am"] = { "<cmd>CopilotChatModels<cr>", desc = "View/select available models" },
          [leader .. "aa"] = { "<cmd>CopilotChatAgents<cr>", desc = "View/select available agents" },
        },
      }
    end,
  },
}
