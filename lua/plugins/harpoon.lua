---@type LazySpec
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "folke/which-key.nvim" },
    { "folke/snacks.nvim" },
  },

  opts = function(_, opts)
    local core = require("astrocore")
    local harpoon = require("harpoon")
    local leader = "<Leader><Leader>"

    opts.settings = {
      save_on_toggle = true,
      sync_ui_on_close = true,
    }

    harpoon:setup()

    local function normalize_list(t)
      local reordered = {}

      for _, v in pairs(t) do
        if v ~= nil then table.insert(reordered, v) end
      end

      return reordered
    end

    core.set_mappings({
      n = {
        [leader] = { desc = "Harpoon" },
        [leader .. "o"] = {
          function()
            require("snacks").picker({
              on_show = function() vim.cmd.stopinsert() end,
              finder = function()
                local file_paths = {}
                local list = normalize_list(harpoon:list().items)
                for _, item in ipairs(list) do
                  table.insert(file_paths, { text = item.value, file = item.value })
                end

                return file_paths
              end,

              win = {
                input = {
                  keys = { ["dd"] = { "harpoon_delete", mode = { "n", "x" } } },
                },
                list = {
                  keys = { ["dd"] = { "harpoon_delete", mode = { "n", "x" } } },
                },
              },
              actions = {
                harpoon_delete = function(picker, item)
                  local to_remove = item or picker:selected()
                  harpoon:list():remove({ value = to_remove.text })
                  harpoon:list().items = normalize_list(harpoon:list().items)
                  picker:find({ refresh = true })
                end,
              },
            })
          end,
          desc = "Toggle UI",
        },
        [leader .. "a"] = { function() harpoon:list():add() end, desc = "Add file" },
        [leader .. "n"] = { function() harpoon:list():next() end, desc = "Next" },
        [leader .. "p"] = { function() harpoon:list():prev() end, desc = "Previous" },
        [leader .. "1"] = { function() harpoon:list():select(1) end, desc = "Go to 1" },
        [leader .. "2"] = { function() harpoon:list():select(2) end, desc = "Go to 2" },
        [leader .. "3"] = { function() harpoon:list():select(3) end, desc = "Go to 3" },
        [leader .. "4"] = { function() harpoon:list():select(4) end, desc = "Go to 4" },
        [leader .. "5"] = { function() harpoon:list():select(5) end, desc = "Go to 5" },
      },
    })
  end,
}
