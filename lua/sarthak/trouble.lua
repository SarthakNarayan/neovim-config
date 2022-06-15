-- https://github.com/folke/trouble.nvim

local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	vim.notify("ERROR: Trouble Plugin - lua/sarthak/trouble.lua")
	return
end

trouble.setup({
	position = "right",
	action_keys = {
		close = "q", -- close the list
		refresh = "r", -- manually refresh
		jump_close = { "o" }, -- jump to the diagnostic and close the list
		toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
		toggle_preview = "P", -- toggle auto_preview
		hover = "K", -- opens a small popup with the full multiline message
		toggle_fold = { "zA", "za" }, -- toggle fold of current file
	},
})
