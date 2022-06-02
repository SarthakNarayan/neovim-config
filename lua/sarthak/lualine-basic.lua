local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("ERROR: Completion plugin - lua/sarthak/cmp.lua")
	return
end

-- lualine.setup()
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

lualine.setup()
