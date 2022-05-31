local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("ERROR: Bufferline plugin - lua/sarthak/bufferline.lua")
  return
end

bufferline.setup{
  options = {
    numbers = "ordinal",
    close_command = "Bdelete! %d", 
    right_mouse_command = "Bdelete! %d",
    offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } }, -- no tabs over nvim-tree
  }
}
