-- AstroNvim key mappings file
-- The `mappings` table supports Vim modes as keys:
--   n = normal mode
--   i = insert mode
--   v = visual mode
--   x = visual block mode
--   t = terminal mode
-- Each keymap entry can have:
--   - a function or command string
--   - a `desc` for which-key display
--   - a `cond` for conditional loading (e.g., LSP capabilities)

---@type LazySpec[]
return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      local core = require "astrocore"
      opts.mappings = core.extend_tbl(opts.mappings, {
        n = {
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      })
    end,
  },
}
