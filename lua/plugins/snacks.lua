---@type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    keymaps = {
      scroll_preview_down = { "<S-j>" },
      scroll_preview_up = { "<S-k>" },
    },
  },
}
