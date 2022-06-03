-- https://github.com/nvim-treesitter/nvim-treesitter

local languages = {
  "lua",
  "java",
  "typescript", "javascript",
  "html", "css",
  "python",
  "go", "gomod", "proto",
  "dockerfile",
  "bash",
  "cpp",
  "http",
  "jsdoc", "json", "json5",
}

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("ERROR: Treesitter Plugin - lua/sarthak/treesitter.lua")
  return
end


configs.setup {
  ensure_installed = languages,
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  autopairs = {
		enable = true,
	},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled for highlighting
    additional_vim_regex_highlighting = false, -- enabling it may slow down the editor
  },
  indent = { enable = true, disable = { "yaml" } },

  -- rainbow brackets highlighting plugin
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}

