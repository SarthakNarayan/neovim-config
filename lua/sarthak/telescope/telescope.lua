-- Remember telescope is just a fuzzy finder
-- Documentation : https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt

-- !!!!!! By default in telescope hidden files (example .git) and files ignored by .gitignore and .ignore are ignored !!!!!
-- By default telescope doesn't exclude any folders from search, you don't see .git and node_modules folder is because of the above reason

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("ERROR: LSP Plugin - lua/sarthak/telescope.lua")
	return
end

-- ########################## EXTENSIONS ##########################
-- telescope.load_extension('media_files') -- preview media files in telescope
-- telescope.load_extension('notify') -- if you want to filter notify using telescope
require("telescope").load_extension("fzf") -- enable native fzf for telescope
require("telescope").load_extension("neoclip")

-- ########################## SHORTCUTS ##########################
vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
-- if you don't want telescope find files to ignore the .gitignore files
-- vim.keymap.set("n", "<leader>f", function()
-- 	require("telescope.builtin").find_files({ no_ignore = true })
-- end)

-- if you don't want preview
-- vim.keymap.set('n', '<leader>f', function()
--   require('telescope.builtin').find_files { previewer = false }
-- end)
vim.keymap.set("n", "<leader>r", require("telescope.builtin").live_grep)
-- if you want fuzzy find in the buffer
-- vim.keymap.set('n', '<leader>ff', require('telescope.builtin').current_buffer_fuzzy_find)
-- search the string (under the cursor) in the entire workspace
vim.keymap.set("n", "<leader>s", require("telescope.builtin").grep_string)
-- setting a key binding for neoclip
vim.keymap.set("n", "<leader>c", "<cmd>Telescope neoclip<CR>")

local actions = require("telescope.actions")

-- ########################## SETUP ##########################
telescope.setup({
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		-- default key bindings are always there this is just for overriding them
		-- update the documentation in key-plugins.lua also for reference
		mappings = {
			-- key bindings in insert mode
			i = {
				["<leader>f"] = actions.close,
			},

			-- key bindings in normal mode
			n = {
				-- ["<esc>"] = actions.close,
				["q"] = actions.close,
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
})

-- ignoring file patterns
-- require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules" }} }

-- Using telescope commands
require("sarthak.telescope.telescope-commands")
