---@type LazySpec
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "folke/which-key.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },

  opts = function (_, opts)
    local core = require("astrocore")
    local harpoon = require("harpoon")
    local conf = require("telescope.config").values
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local list = harpoon:list()
    local leader = "<Leader><Leader>"

    opts.settings = {
      save_on_toggle = true,
      sync_ui_on_close = true,
    }

    harpoon:setup()

    local function toggle_telescope(harpoon_list)
      local file_paths = {}

      for i, item in ipairs(harpoon_list.items) do
        table.insert(file_paths, string.format("%d. %s", i, item.value))
      end

      pickers.new({}, {
        prompt_title = "Harpoon",
        finder = finders.new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),

        attach_mappings = function(_, map)
          map("i", "<CR>", function(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)

            local path = selection[1]:match("^%d+%. (.*)$") or selection[1]
            vim.cmd("edit " .. vim.fn.fnameescape(path))
          end)
          return true
        end,
    }):find()

    end

    core.set_mappings({
      n = {
        [leader] = { desc = "Harpoon" },
        [leader .. "e"] = { function() harpoon.ui:toggle_quick_menu(list) end, desc = "Toggle UI" },
        [leader .. "t"] = { function() toggle_telescope(list) end, desc = "Toggle UI" },
        [leader .. "a"] = { function() harpoon:list():add() end, desc = "Add file" },
        [leader .. "n"] = { function() harpoon:list():next() end, desc = "Next" },
        [leader .. "p"] = { function() harpoon:list():prev() end, desc = "Previous" },
        [leader .. "1"] = { function() harpoon:list():select(1) end, desc = "Go to 1" },
        [leader .. "2"] = { function() harpoon:list():select(2) end, desc = "Go to 2" },
        [leader .. "3"] = { function() harpoon:list():select(3) end, desc = "Go to 3" },
        [leader .. "4"] = { function() harpoon:list():select(4) end, desc = "Go to 4" },
        [leader .. "5"] = { function() harpoon:list():select(5) end, desc = "Go to 5" },
      }
    })
      end
}
