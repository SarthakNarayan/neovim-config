-- https://github.com/goolord/alpha-nvim

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  vim.notify("ERROR: Alpha Plugin - lua/sarthak/alpha.lua")
  return
end

alpha.setup(
  require('alpha.themes.startify').config
)
