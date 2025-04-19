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
--
--   Setting a mapping to false will disable it
--   ["C-S"] = false

---@type LazySpec[]
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      local core = require "astrocore"
      local buffer = require("astrocore.buffer")
      local heirline = require("astroui.status.heirline")
      opts.mappings = core.extend_tbl(opts.mappings, {
        n = {
          ["]b"] = { function() buffer.nav(vim.v.count1) end, desc = "Next buffer" },
          ["[b"] = { function() buffer.nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<Leader>bd"] = {
            function()
              heirline.buffer_picker(
                function(bufnr) buffer.close(bufnr) end
              )
            end,
            desc = "Close buffer from tabline",
          },
        },
      })
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
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
          ["<Leader>uY"] = {
            function()
              local bufnr = vim.api.nvim_get_current_buf()
              require("astrolsp.toggles").buffer_semantic_tokens(bufnr)
            end,
            desc = "Toggle semantic tokens",
            cond = function(client)
              return client.supports_method "textDocument/semanticTokens/full"
            end,
          },
        },
      })
    end,
  }
}
