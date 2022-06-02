local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("ERROR: LSP Plugin - lua/sarthak/lsp/init.lua")
	return
end

require("sarthak.lsp.lsp-installer")
require("sarthak.lsp.handlers").setup()

-- points
-- When you are installting a language server you are not installing it as a plugin but you are installing a server on your computer
