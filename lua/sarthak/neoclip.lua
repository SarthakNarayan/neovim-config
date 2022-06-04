-- https://github.com/AckslD/nvim-neoclip.lua

local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
  vim.notify("ERROR: Neoclip Plugin - lua/sarthak/neoclip.lua")
  return
end

neoclip.setup()
