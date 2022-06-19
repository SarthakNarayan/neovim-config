local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("", ",", "<Nop>", opts)

-- Plugins related keymaps

-- ##########################################################################################
-- Normal mode

-- ########## CMP ##########
-- tab, ctrl j,k to move forward and backward
-- ctrl + space for trigger and ctrl + c to close
-- more information in the cmp.lua file

-- ########## TELESCOPE ##########
-- in the telescope.lua file
-- leader f to toggle it in telescope insert mode,
-- q to quit in telescope normal mode

-- ########## COMMENTS ##########
-- gcc : comment toggling using linewise comment
-- gbc : comment toggling using blockwise comment

-- ########## NVIM-TREE ##########
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- h : close nodes - mapping in nvim-tree.lua
-- v : vertical split - mapping in nvim-tree.lua
-- l,o : open the file (same as enter) - mapping in nvim-tree.lua
-- useful defaults
-- R, S, H/I : Refresh, Search, Toggle Hidden/Git ignored files
-- a, d/D, r : Create (leaving a / will add a directory), disabled/trash a file (brew install trash) (on mac), Rename file/directories
-- x, c, p : cut, copy paste
-- y, gy : copy name, copy absolute path
-- W, E : collapse all, expand all
-- Tab : preview the files without leaving the left hand side. If you use something like l,o,w then you will be put to the right hand side

-- ########## BUFFERLINE ##########
-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- :q closes the window and not the buffer
keymap("n", "<leader>w", ":Bdelete!<CR>", opts) -- won't work without https://github.com/moll/vim-bbye plugin

-- ########## SYMBOLS_OUTLINE ##########
vim.keymap.set("n", "<leader>a", "<cmd>SymbolsOutline<CR>")

-- ########## TROUBLE ##########
vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<CR>") -- for the whole workspace
vim.keymap.set("n", "gq", "<cmd>TroubleToggle loclist<CR>") -- for the local file

-- ########## LF ##########
vim.keymap.set("n", "<leader>l", "<cmd>Lfcd<CR>")

-- ########## TOGGLE TERM ##########
-- <leader>t - mapped in toggleterm.lua

-- ##########################################################################################
-- Visual mode

-- ########## COMMENTS ##########
-- gc : Toggles the region using linewise comment
-- gb : Toggles the region using blockwise comment

-- ##########################################################################################
-- Insert mode

-- ########## LSP SIGNATURE ##########
-- <C-c> to toggle hint on and off
