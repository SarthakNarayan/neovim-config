local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("ERROR: Completion plugin - lua/sarthak/cmp.lua")
  return
end

-- loading the lua snip engine
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- whenever we install a new completion we need to add it to the sources and vim_item.menu
cmp.setup {

  -- for the snippet engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  -- key mappings
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- move up in menu
		["<C-j>"] = cmp.mapping.select_next_item(), -- move down in menu
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }, -- close the menu
    
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },

  -- formatting options of the completion menu that shows up
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- this tells the source of completion, good to have and updated when a new source is added
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        -- luasnip = "[Snippet]",
        buffer = "[Buffer]",
      })[entry.source.name]
      return vim_item
    end,
  },

  -- sources for completion. Add the new completions here for them to take effect
  -- even if the sources are not present in plugins.lua adding it here won't give any errors
  -- order in which keep them matters decreasing from top to bottom
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" }, -- this is also pretty annoying
    -- { name = "luasnip" }, I don't use snippets
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  -- documentation and completion window
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered(),
  },

  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
