local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("", ",", "<Nop>", opts)

-- Plugins related keymaps

-- ##########################################################################################
-- Normal mode

-- cmp
-- tab, ctrl j,k to move forward and backward
-- ctrl + space for trigger and ctrl + e to close
-- more information in the cmp.lua file

-- Treesitter
-- keymap("n", "<leader>rh", "<cmd>TSBufEnable highlight<cr>", opts) -- disabled since it was slowing down ripgrep
-- enable highlighting if something goes wrong. rh stands for rehighlight

-- telescope keymaps
-- in the telescope.lua file
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts) -- preview
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts) -- no preview
-- keymap("n", "<leader>r", "<cmd>Telescope live_grep<cr>", opts) --ripgrep must be installed for this to work

-- comments
-- gcc : comment toggling using linewise comment
-- gbc : comment toggling using blockwise comment

-- telescope
-- All the basic stuff, can be found in telescope.lua file
-- Use q - after going to normal mode
-- Thought of using <C-c> and <leader>w (similar to cmd + w) but wasn't very friendly

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- h : close nodes - mapping in nvim-tree.lua
-- v : vertical split - mapping in nvim-tree.lua
-- l,o : open the file (same as enter) - mapping in nvim-tree.lua
-- useful defaults
-- R, S, H : Refresh, Search, Toggle Hidden files
-- a, d/D, r : Create (leaving a / will add a directory), disabled/trash a file (brew install trash) (on mac), Rename file/directories
-- x, c, p : cut, copy paste
-- y, gy : copy name, copy absolute path
-- W, E : collapse all, expand all
-- Tab : preview the files without leaving the left hand side. If you use something like l,o,w then you will be put to the right hand side

-- bufferline
-- Navigate buffers
-- keymap("n", "<leader>l", ":bnext<CR>", opts)
-- keymap("n", "<leader>h", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- :q closes the window and not the buffer
keymap("n", "<leader>w", ":Bdelete!<CR>", opts) -- won't work without https://github.com/moll/vim-bbye plugin

-- aerial key bindings
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")

-- toggle term
-- <leader>t - mapped in toggleterm.lua

-- ##########################################################################################
-- Visual mode

-- comments
-- gc : Toggles the region using linewise comment
-- gb : Toggles the region using blockwise comment

-- ##########################################################################################
-- Insert mode
-- telescope
-- <leader>f to close the prompt, trying to make <leader>f as toggle
-- It only works when you are in insert mode in the telescope prompt

-- lsp signature
-- <C-c> to toggle hint on and off
