---@type LazySpec
return {
  "andythigpen/nvim-coverage",
  event = "VeryLazy",
  opts = {
    auto_reload = true,
    load_coverage_cb = function(ftype) return ftype == "go" end,
    lang = {
      go = {
        coverage_file = "coverage.out",
      },
    },
  },
  keys = {
    {
      "<leader>Tc",
      function()
        require("coverage").load(true)
        require("coverage").toggle()
      end,
      desc = "Toggle coverage",
    },
    {
      "<leader>Tl",
      function() require("coverage").load(true) end,
      desc = "Toggle coverage",
    },
    {
      "<leader>Tx",
      function() require("coverage").clear() end,
      desc = "Clear coverage",
    },
    {
      "<leader>TC",
      function() require("coverage").summary() end,
      desc = "Show coverage summary",
    },
  },
}
