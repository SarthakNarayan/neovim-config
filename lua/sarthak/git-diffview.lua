local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
	vim.notify("ERROR: Diffview Plugin - lua/sarthak/git-diffview.lua")
	return
end

local status_ok, actions = pcall(require, "diffview.actions")
if not status_ok then
	vim.notify("ERROR: Diffview actions - lua/sarthak/git-diffview.lua")
	return
end

diffview.setup({
	keymaps = {
		disable_defaults = true,
		view = {
			["<tab>"] = actions.select_next_entry, -- Open the diff for the next file
			["<s-tab>"] = actions.select_prev_entry, -- Open the diff for the previous file
			["<leader>e"] = actions.toggle_files, -- Toggle the files panel.
		},
		file_panel = {
			["j"] = actions.next_entry,
			["k"] = actions.prev_entry,
			["<cr>"] = actions.select_entry,
			["l"] = actions.select_entry,
			["<leader>e"] = actions.toggle_files, -- Toggle the files panel.
		},
		file_history_panel = {
			["j"] = actions.next_entry,
			["k"] = actions.prev_entry,
			["<cr>"] = actions.select_entry,
			["l"] = actions.select_entry,
			["<leader>e"] = actions.toggle_files,
		},
		option_panel = {
			["<tab>"] = actions.select_entry,
			["q"] = actions.close,
		},
	},
})
vim.cmd("set fillchars+=diff:╱")

function DiffviewToggle()
	local lib = require("diffview.lib")
	local view = lib.get_current_view()
	if view then
		vim.cmd(":DiffviewClose")
	else
		vim.cmd(":DiffviewOpen")
	end
end

vim.cmd("command! " .. "GD" .. " :lua " .. "DiffviewToggle()")
