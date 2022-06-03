local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("ERROR: LSP Plugin - lua/sarthak/lsp/init.lua")
	return
end

require("sarthak.lsp.lsp-installer")
require("sarthak.lsp.handlers").setup()
require("sarthak.lsp.signature")
