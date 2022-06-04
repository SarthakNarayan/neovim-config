-- Setting up the on_attach function with keybindings as suggested in the official documentation
-- https://github.com/neovim/nvim-lspconfig
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  -- all these functions mightnot be supported by that particular language server
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

  -- jump to function definition or variable definition, will be used the most
  -- in some languages like python if you use it on import json then it will take you to the json package
  -- This may be available for all languages like it didn't work for me in java
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader><space>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  -- rename all the occurences of that function or variable
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  -- find and next and previous diagnostis
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>m", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- Adding the cmp as a capability
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'pyright',
  'tsserver',
  'sumneko_lua',
  'jsonls',
  'html',
  'bashls',
  'dockerls',
  'gopls'
}

-- to know about settings for each server and options use LspInstallInfo and then use enter to go into server configurations
for _, lsp in pairs(servers) do

  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

   -- server specific configuration
	 if lsp == "sumneko_lua" then
	 	local jsonls_opts = require("sarthak.lsp-new.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if lsp == "jsonls" then
	 	local jsonls_opts = require("sarthak.lsp-new.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 -- if lsp == "pyright" then
	 -- 	local jsonls_opts = require("sarthak.lsp-new.settings.pyright")
	 -- 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 -- end

    require('lspconfig')[lsp].setup(opts)
end
