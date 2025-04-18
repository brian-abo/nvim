---@type LazySpec
return {
  "stevearc/resession.nvim",
  opts = {
    autosave = {
      enabled = true,
      only_in_session = false,
    },
    -- you can also customize session filtering, paths, etc here
  },
}
