---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    local cheatsheet_path = vim.fn.stdpath("config") .. "/cheatsheet.md"

    vim.api.nvim_create_user_command("Cheatsheet", function()
      vim.cmd("tabnew " .. cheatsheet_path)
    end, {
      desc = "Open Goland → AstroNvim cheatsheet",
    })
  end,
}
