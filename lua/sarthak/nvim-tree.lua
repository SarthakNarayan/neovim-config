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

nvim_tree.setup({
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

	hijack_directories = {
		enable = true,
		auto_open = true,
	},

	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},

	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},

	trash = {
		cmd = "trash",
		require_confirm = true,
	},

	renderer = {
		-- highlight_opened_files = "all",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},

		-- icons won't be used if indent markers are enabled
		-- icon cheatsheet : https://www.nerdfonts.com/cheat-sheet
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
				git = {
					-- unstaged = "✗",
					unstaged = "US",
					staged = "S",
					unmerged = "",
					renamed = "R",
					untracked = "UT",
					deleted = "D",
					ignored = "I",
				},
			},
		},
	},

	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },

				{ key = "D", action = "" },
				{ key = "x", action = "" },
				{ key = "c", action = "" },
				{ key = "y", action = "copy" },
				{ key = "p", action = "paste" },
				{ key = "d", action = "cut" },
				{ key = "T", action = "trash" },
			},
		},
		number = false,
		relativenumber = false,
	},
})
