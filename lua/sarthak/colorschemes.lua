local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- dark,
-- require('onedark').setup {
--     style = 'dark'
-- }
-- require('onedark').load()
