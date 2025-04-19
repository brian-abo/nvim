---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = opts.window or {}
    opts.window.mappings = opts.window.mappings or {}

    -- Unmap "f/" from neo-tree's window mappings
    -- This mapping was causing a bug that caused a warning popup when toggling tabs in the file explorer
    opts.window.mappings["f/"] = nil
  end,
}

