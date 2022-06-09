-- It just installs the servers, to setup the servers you have to manually include it in the servers array in lsp-config
-- https://github.com/williamboman/nvim-lsp-installer
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("ERROR: lsp_installer Plugin - lua/sarthak/lsp/lsp-installer.lua")
	return
end

lsp_installer.setup({
	-- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer", "sumneko_lua" }
	-- This setting has no relation with the `automatic_installation` setting.
	ensure_installed = {},

	-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	-- This setting has no relation with the `ensure_installed` setting.
	-- Can either be:
	--   - false: Servers are not automatically installed.
	--   - true: All servers set up via lspconfig are automatically installed.
	--   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	--       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	automatic_installation = true,
})
