local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
    vim.notify("ERROR: LSP Signature - lua/sarthak/lsp/signature.lua")
	return
end

lsp_signature.setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
})
