-- https://github.com/stevearc/aerial.nvim#lsp

-- #### !!!! IMPORTANT ####
-- You either need a lsp or treesitter to use aerial
-- If you only need the function/methods/class outline then you can use treesitter backend
-- For the languages that are not supported by treesitter you will have to use the lsp backend
-- If you need variables also then you need to use lsp backend and it has to be configured for aerial.
-- require("aerial").on_attach(client, bufnr) has to be added to the on_attach function
-- In that case it is better to use symbols outline since it is much more clean

-- If we want to fuzzy find the symbols in aerial we can use :Telescope aerial

local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	vim.notify("ERROR: Trouble Plugin - lua/sarthak/aerial-outline.lua")
	return
end

aerial.setup({
	backends = { "treesitter" },
	-- backends = { "lsp" }, -- if you want to use lsp as the main backend
	filter_kind = false,
})
