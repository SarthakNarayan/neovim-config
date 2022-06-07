local commands_table = {
	["Tof"] = "oldfiles",
	["Tsh"] = "search_history",
	-- ["Tvo"] = "vim_options",
	["Tcmd"] = "commands", -- list all the commands in neovim
	["Thlp"] = "help_tags", -- get all the help docs
	-- ["Tkey"] = "keymaps",
	["Tcol"] = "colorscheme",

	["Tlrf"] = "lsp_references", -- cursor should be on the variable/function for which you want to find the references
	["Tlds"] = "lsp_document_symbols",
	["Tld"] = "diagnostics", -- get all the diagnostics
	-- ["Tli"] = "lsp_implementations",
	-- ["Tldd"] = "lsp_definitions",

	-- ["Tgc"] = "git_commits",
	-- ["Tgb"] = "git_branches",
	["Tgs"] = "git_status", -- to see what all has changed
	-- ["Tgf"] = "git_files",
}

for command, action in pairs(commands_table) do
	vim.cmd("command! " .. command .. " :Telescope " .. action)
end
