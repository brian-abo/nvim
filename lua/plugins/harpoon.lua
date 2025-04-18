---@type LazySpec
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    settings = {
      save_on_toggle = true,
      save_on_ui_close = true,
    },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")
    harpoon:setup(opts)
    require("telescope").load_extension("harpoon")
  end,
}
