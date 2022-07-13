local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	-- all these functions mightnot be supported by that particular language server
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	-- jump to function definition or variable definition, will be used the most
	-- in some languages like python if you use it on import json then it will take you to the json package
	-- This may be available for all languages like it didn't work for me in java
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- pressing it again will go inside the hover window if its large
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space><space>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	-- rename all the occurences of that function or variable
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- much better for viewing all the references if for some reason telescope is not working then uncomment the above line
	-- insipiration from telescope-commands
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	-- find and next and previous diagnostis
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gN", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)

	-- list all the diagnostics in a list in a pane below
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	-- using trouble.nvim which is much better mapped to gq if for some reason trouble is not working uncomment the above line
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-- Setting up the on_attach function with keybindings as suggested in the official documentation
-- https://github.com/neovim/nvim-lspconfig
local on_attach = function(client, bufnr)
	-- Document highlighting when lsp server attaches to the buffer
	-- This could have been added in nullls on attach function also, i.e when null ls attaches to the buffer
	-- To know the difference between lsp and null-ls read plugins-help sections
	-- Highlight occurences of that word through out the document
	-- !!! This might not be supported by all the colorschemes
	lsp_highlight_document(client)

	-- Key mappings when lsp server attaches to the server
	-- If you want to fuzzy find through these diagnostics use the telescope commands
	lsp_keymaps(bufnr)

	-- setting up aerial to use lsp
	-- require("aerial").on_attach(client, bufnr)

	-- if tsserver is the lsp server then don't use its formatter for formatting, we will be using null ls
	-- so if you see that your language server is colliding with null ls then disable it here
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end

	-- using nullls for formatting, if you want to use gopls for formatting then comment these lines and remove null-ls formatting
	if client.name == "gopls" then
		client.resolved_capabilities.document_formatting = false
	end

	-- using stylua for formatting
	if client.name == "sumneko_lua" then
		client.resolved_capabilities.document_formatting = false
	end

	-- using prettier for formatting
	if client.name == "jsonls" then
		client.resolved_capabilities.document_formatting = false
	end

	-- using prettier (null ls) for formatting
	if client.name == "html" then
		client.resolved_capabilities.document_formatting = false
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- code folding capability for nvim-ufo (lua/sarthak/lsp/code-folding.lua)
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- Adding the cmp as a capability
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- The servers that you want to use must be installed using LspInstallInfo and then added here
-- LspInstallInfo won't setup the servers, after installing them they must be added here
local servers = {
	"pyright",
	"tsserver",
	"sumneko_lua",
	"jsonls",
	"html",
	"bashls",
	"dockerls",
	"gopls",
	"yamlls",
	"ltex", -- for git commits and markdown files, java must be installed for it to work
}

-- to know about settings for each server and options use LspInstallInfo and then use enter to go into server configurations
for _, lsp in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- server specific configuration
	if lsp == "sumneko_lua" then
		local luals_opts = require("sarthak.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", luals_opts, opts)
	end

	if lsp == "jsonls" then
		local jsonls_opts = require("sarthak.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if lsp == "yamlls" then
		local yamlls_opts = require("sarthak.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	end

	require("lspconfig")[lsp].setup(opts)
end
