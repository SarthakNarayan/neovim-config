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
-- Added keybindings
-- h : close nodes - mapping in nvim-tree.lua
-- v : vertical split - mapping in nvim-tree.lua
-- l,o : open the file (same as enter) - mapping in nvim-tree.lua
-- d, y, p: cut, copy, paste (similar to vim and lf bindings)
-- Advisable to use lf for moving things around because it has a clear selection button

-- useful defaults
-- R, S, H/I : Refresh, Search, Toggle Hidden/Git ignored files
-- a,r : Create (leaving a / will add a directory), Rename file/directories
-- W, E : collapse all, expand all
-- Tab : preview the files without leaving the left hand side. If you use something like l,o,w then you will be put to the right hand side

-- ########## BUFFERLINE ##########
-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- :q closes the window and not the buffer
keymap("n", "<leader>w", ":Bdelete!<CR>", opts) -- won't work without https://github.com/moll/vim-bbye plugin

-- ########## AERIAL ##########
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- ########## SYMBOLS_OUTLINE ##########
-- vim.keymap.set("n", "<leader>a", "<cmd>SymbolsOutline<CR>")
-- key binded to aerial instead of SYMBOLS_OUTLINE since it shows too much stuff.
-- Aerial is minimal and works without lsp also

-- ########## TROUBLE ##########
vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle<CR>") -- for the whole workspace
vim.keymap.set("n", "gq", "<cmd>TroubleToggle loclist<CR>") -- for the local file

-- ########## LF ##########
vim.keymap.set("n", "<leader>l", "<cmd>Lfcd<CR>")

-- ########## TOGGLE TERM ##########
-- <leader>t - mapped in toggleterm.lua

-- ########## HOP ##########
-- works for both normal and visual mode since we haven't specified any mode
vim.keymap.set(
	"",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
)
vim.keymap.set(
	"",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
)

-- ##########################################################################################
-- Visual mode

-- ########## COMMENTS ##########
-- gc : Toggles the region using linewise comment
-- gb : Toggles the region using blockwise comment

-- ##########################################################################################
-- Insert mode

-- ########## LSP SIGNATURE ##########
-- <C-c> to toggle hint on and off
