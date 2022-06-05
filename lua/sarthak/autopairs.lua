local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("ERROR: Autopairs plugin - lua/sarthak/autopairs.lua")
  return
end

-- use treesitter to check for a pair
npairs.setup({
  check_ts = true,
})

-- To hook up with cmp like when you type function name
-- also used for mapping <CR> to automatically indent and add space
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
