---@type LazySpec
return {
  "folke/tokyonight.nvim",
  opts = function(_, opts)
    opts.style = "storm"
    opts.transparent = true
    opts.terminal_colors = true
    opts.styles = {
      sidebars = "transparent",
      floats = "transparent",
    }
    return opts
  end,
}
