-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
require "utils.export-keymaps"
vim.keymap.set("t", "<leader>q", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
