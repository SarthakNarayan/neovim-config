-- ##########################################################################################
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- ##########################################################################################
-- Remap space as leader key
-- Nop means no remap
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- ##########################################################################################
-- Normal --
-- Better window navigation
-- Use Ctrl + h,j,k,l for navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- open file explorer on the left hand side. It is a toggle operation
-- 30 is the amount of with it will take
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
-- In mac make sure you remove misson control keybindings
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- My own
-- Go to end and beginning of the line using H and L. 
-- S stands for Shift
keymap("n", "<S-h>", "^", opts)
keymap("n", "<S-l>", "$", opts)

-- Quicker navigation
-- K is equivalent to 10k
keymap("n", "<S-k>", "10kzz", opts)
keymap("n", "<S-j>", "10jzz", opts)

-- Remapping G to come to centre
keymap("n", "<S-g>", "Gzz", opts)

-- Centre window while searching
keymap("n","n","nzz",opts)
keymap("n","N","Nzz",opts)

-- move between lines if the lines are wrapped
keymap("n","j","gj",opts)
keymap("n","k","gk",opts)



-- ##########################################################################################
-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)



-- ##########################################################################################
-- Visual --
-- Stay in indent mode. Holds the indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move quickly in visual mode
keymap("v", "<S-k>", "10k", opts)
keymap("v", "<S-j>", "10j", opts)

-- move to the end of the line in visual mode
-- without these settings it goes to the end of the line
keymap("v", "<S-l>", "$", opts)
keymap("v", "<S-h>", "^", opts)

