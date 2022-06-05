-- https://github.com/lewis6991/gitsigns.nvim
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  vim.notify("ERROR: Gitsigns plugin - lua/sarthak/gitsigns.lua")
  return
end

gitsigns.setup({
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
})
