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
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = function(_, opts)
      local core = require "astrocore"
      opts.mappings = core.extend_tbl(opts.mappings, {
        n = {
          -- Neotest
          ["<leader>T"] = { desc = "Test (neotest)" },
          ["<leader>Tt"] = { function() require("neotest").run.run() end, desc = "Run nearest test" },
          ["<leader>Tf"] = { function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run test file" },
          ["<leader>To"] = { function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
          ["<leader>Ts"] = { function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },

          -- Harpoon
          ["<leader>Ha"] = {
            function()
              require("harpoon"):list("default"):add()
            end,
            desc = "Add file to Harpoon"
          },
          ["<leader>Hh"] = {
            function()
              local harpoon = require("harpoon")
              local list = harpoon:list("default")
              require("harpoon.ui"):toggle_quick_menu(list)
            end,
            desc = "Toggle Harpoon UI"
          },
          ["<leader>Ht"] = {
            function() require("telescope").extensions.harpoon.marks()
            end,
            desc = "Telescope Harpoon Marks"
          },
          ["<leader>1"] = {
            function()
              require("harpoon"):list("default"):select(1)
            end,
            desc = "Harpoon to file 1"
          },
          ["<leader>2"] = {
            function() require("harpoon"):list("default"):select(2)
            end,
            desc = "Harpoon to file 2"
          },
          ["<leader>3"] = {
            function()
              require("harpoon"):list("default"):select(3)
            end,
            desc = "Harpoon to file 3"
          },
          ["<leader>4"] = {
            function()
              require("harpoon"):list("default"):select(4)
            end,
            desc = "Harpoon to file 4"
          },
        },
      })
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
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
