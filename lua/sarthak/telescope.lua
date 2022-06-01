local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("ERROR: LSP Plugin - lua/sarthak/telescope.lua")
  return
end

-- loading extensions
-- telescope.load_extension('media_files') -- preview media files in telescope

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    -- default key bindings are always there this is just for overriding them
    mappings = {
      -- key bindings in insert mode
      i = {
        ["<leader>f"] = actions.close,
      },

      -- key bindings in normal mode
      n = {
        -- ["<esc>"] = actions.close,
        ["<leader>w"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
