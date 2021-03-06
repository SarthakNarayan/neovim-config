local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("ERROR: LSP Plugin - lua/sarthak/lsp/init.lua")
	return
end

require("sarthak.lsp.lsp-installer")
require("sarthak.lsp.diagnostic-config")
require("sarthak.lsp.signature")
require("sarthak.lsp.lsp-config")
require("sarthak.lsp.null-ls")
require("sarthak.lsp.lsp-commands")
require("sarthak.lsp.code-folding")
