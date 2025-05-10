---@type LazySpec
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    panel = {
      enabled = true,
      auto_refresh = true,
    },
    suggestion = {
      enabled = true,
      keymap = {
        accept = false,
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
      },
    },
  },
}
