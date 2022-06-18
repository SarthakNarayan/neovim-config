local commands_table = {
	["Tof"] = "oldfiles",
	["Tsh"] = "search_history",
	-- ["Tcmd"] = "commands", -- list all the commands in neovim
	["Thlp"] = "help_tags", -- get all the help docs, amazing
	-- ["Tkey"] = "keymaps",
	["Tcol"] = "colorscheme",

	-- cursor should be on the variable/function for which you want to find the references
	-- amazing command mapped to gr in lsp-config.lua file
	["Tlrf"] = "lsp_references",

	-- replaced by trouble
	-- ["Tld"] = "diagnostics", -- get diagnostics of all the buffers

	-- this part is replaced by ..
	-- ["Tgc"] = "git_commits",
	-- ["Tgb"] = "git_branches",
	["Tgs"] = "git_status", -- to see what all has changed
	-- ["Tgf"] = "git_files",
}

for command, action in pairs(commands_table) do
	vim.cmd("command! " .. command .. " :Telescope " .. action)
end
