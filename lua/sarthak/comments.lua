-- https://github.com/numToStr/Comment.nvim

local status_ok, comments = pcall(require, "Comment")
if not status_ok then
  vim.notify("ERROR: Comment plugin - lua/sarthak/comments.lua")
  return
end

comments.setup()