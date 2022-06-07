local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	vim.notify("ERROR: Aerial Plugin - lua/sarthak/aerial.lua")
	return
end

aerial.setup({})
