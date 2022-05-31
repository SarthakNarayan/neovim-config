local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("", ",", "<Nop>", opts)

-- Plugins related keymaps

-- ##########################################################################################
-- Normal mode

-- telescope keymaps
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts) -- preview
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts) -- no preview
keymap("n", "<leader>r", "<cmd>Telescope live_grep<cr>", opts) --ripgrep must be installed for this to work

-- comments
-- gcc : comment toggling using linewise comment
-- gbc : comment toggling using blockwise comment

-- telescope
-- All the basic stuff, can be found in telescope.lua file
-- <leader>w (similar to cmd + w): to close the prompy instead of escape if you decide you don't want to make a selection 
-- Thought of using <C-c> but wasn't very friendly

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- h : close nodes - mapping in nvim-tree.lua
-- v : vertical split - mapping in nvim-tree.lua
-- l,o : open the file (same as enter) - mapping in nvim-tree.lua
-- useful defaults
-- R, S, H : Refresh, Search, Toggle Hidden files
-- a, d/D, r : Create (leaving a / will add a directory), Remove/Trash a file, Rename file/directories
-- x, c, p : cut, copy paste
-- y, gy : copy name, copy absolute path
-- W, E : collapse all, expand all
-- Tab : to view

-- bufferline
-- Navigate buffers
-- keymap("n", "<leader>l", ":bnext<CR>", opts)
-- keymap("n", "<leader>h", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
-- :q closes the window and not the buffer
keymap("n", "<leader>w", ":Bdelete!<CR>", opts) -- won't work without https://github.com/moll/vim-bbye plugin

-- toggle term
-- <leader>t - mapped in toggleterm.lua

-- ##########################################################################################
-- Visual mode

-- comments
-- gc : Toggles the region using linewise comment
-- gb : Toggles the region using blockwise comment
