local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  vim.notify("ERROR: Gitsigns plugin - lua/sarthak/gitsigns.lua")
  return
end

gitsigns.setup()