-- :help options
local set = vim.opt

-- allows neovim to access the system clipboard
-- vim.opt.clipboard = "unnamedplus"

-- more space in the neovim command line (at the bottom) for displaying messages. Default is 1
-- vim.opt.cmdheight = 2

-- Insert mode completion using tab
vim.opt.completeopt = { "menuone", "noselect" } 

-- so that `` is visible in markdown files
vim.opt.conceallevel = 0

-- the encoding written to a file
vim.opt.fileencoding = "utf-8"                  

-- highlight all matches on previous search pattern
vim.opt.hlsearch = true                         

-- ignore case in search patterns
vim.opt.ignorecase = true                       

-- allow the mouse to be used in neovim in all modes
vim.opt.mouse = "a"                             

-- no of items to show in pop up menu when you use tab
vim.opt.pumheight = 10                          

-- we don't need to see things like -- INSERT -- anymore at the bottom of the screen
vim.opt.showmode = false                        

-- always show tabs
vim.opt.showtabline = 2                         

-- smart case
vim.opt.smartcase = true                        

vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)

-- save undo history to an undo file
vim.opt.undofile = true                         
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab

vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time

-- wrap long text
vim.opt.wrap = true                            

-- scroll automatically when nearing the end of screen
vim.opt.scrolloff = 10                           
vim.opt.sidescrolloff = 10
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

vim.opt.shortmess:append "c"

-- we can run vimscript
vim.cmd "set whichwrap+=<,>,[,],h,l"

-- treats words like hello-world as one word so dw will remove hello-world and not just hello or world depending on where your cursor is
vim.cmd [[set iskeyword+=-]]

-- to not continue comments
-- https://www.reddit.com/r/neovim/comments/sqld76/stop_automatic_newline_continuation_of_comments/
-- https://www.reddit.com/r/neovim/comments/ijukpr/problem_with_removing_auto_comment/
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

