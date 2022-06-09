local commands_table = {
	["LI"] = "LspInfo",
	["LII"] = "LspInstallInfo",
	["NI"] = "NullLsInfo",
}

for command, action in pairs(commands_table) do
	vim.cmd("command! " .. command .. " : " .. action)
end
