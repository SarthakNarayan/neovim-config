-- https://github.com/kyazdani42/nvim-tree.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("ERROR: Nvimtree plugin - lua/sarthak/nvim-tree.lua")
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  vim.notify("ERROR: Nvimtree plugin - lua/sarthak/nvim-tree.lua")
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,

    ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
    },

    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,

    update_to_buf_dir = {
      enable = true,
      auto_open = true,
    },

    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },

    git = {
      enable = false,
      ignore = true,
      timeout = 500,
    },

    trash = {
        cmd = "trash",
        require_confirm = true,
      },

    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = "left",
      auto_resize = true,
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },

          -- to remove deletion using d
          -- use D to delete, it will trash the files in mac, trash must be installed
          -- brew install trash
          { key = "d", action = "" }, 
        },
      },
      number = false,
      relativenumber = false,
    },
}
