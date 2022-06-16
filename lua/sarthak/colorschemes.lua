-- local colorscheme = "tokyonight"

-- https://github.com/marko-cerovac/material.nvim
vim.g.material_style = "palenight"
local colorscheme = "material"

require("material").setup({
	italics = {
		comments = true, -- Enable italic comments
		keywords = true, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false, -- Enable italic variables
	},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
