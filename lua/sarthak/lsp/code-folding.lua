vim.wo.foldcolumn = "4" -- left side column width and not showing fold numbers
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true

-- code folding
-- https://github.com/kevinhwang91/nvim-ufo
-- za to toggle folding, l to open folds if closed
local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
	vim.notify("ERROR: Ufo Plugin - lua/sarthak/lsp/code-folding.lua")
	return
end

ufo.setup()
