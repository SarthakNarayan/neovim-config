vim.notify = require("notify")

-- Deleting the cached file - LuaCacheClear
local status_ok, impatient = pcall(require, "impatient")
  if impatient.enable_profile() then
end

require 'sarthak.options'
require 'sarthak.keymaps'
require 'sarthak.plugins'
require 'sarthak.colorschemes'
require 'sarthak.cmp'
require 'sarthak.lsp'
require 'sarthak.telescope'
require 'sarthak.treesitter'
require 'sarthak.autopairs'
require 'sarthak.comments'
require 'sarthak.gitsigns'
require 'sarthak.nvim-tree'
require 'sarthak.bufferline'
require 'sarthak.lualine-evil'
require 'sarthak.toggleterm'
require 'sarthak.indentline'
require 'sarthak.alpha'
