local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {

    -- Python
    -- pip3 install flake8, pip3 install black
    formatting.black.with { extra_args = { "--fast" } },
    diagnostics.flake8, -- extra diagnostics

    -- JS, TS
    formatting.prettier,
    -- formatting.yapf,

    -- Lua, currently using the lsp sumenko_lua for formatting
    -- formatting.stylua,

    -- Go
    formatting.gofmt,
  },
}
