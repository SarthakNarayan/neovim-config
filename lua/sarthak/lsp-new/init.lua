local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("ERROR: LSP Plugin - lua/sarthak/lsp-new/init.lua")
	return
end

require("sarthak.lsp-new.lsp-installer")
require("sarthak.lsp-new.diagnostic-config")
require("sarthak.lsp-new.signature")
require("sarthak.lsp-new.lsp-config")
