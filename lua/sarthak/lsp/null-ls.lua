-- To know the difference between lsp and null-ls read plugins-help sections
-- Reference: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- Other built in features are: code action, hover and completion
-- Reference: https://github.com/jose-elias-alvarez/null-ls.nvim#features

-- For format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {

	-- Python
	-- pip3 install flake8, pip3 install black
	formatting.black.with({ extra_args = { "--fast" } }),
	diagnostics.flake8, -- extra diagnostics

	-- JS, TS, JSON
	formatting.prettier,
	-- formatting.yapf,

	-- install rust, cargo install rust
	formatting.stylua,

	-- Go
	formatting.gofmt,

	-- Bash
	formatting.shfmt,
}

null_ls.setup({
	debug = false,
	sources = sources,

	-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
	on_attach = function(client, bufnr)
		-- this may be supported by all the sources, for example this doesn't work for lua files since I am using sumenko_lua
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
