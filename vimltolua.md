## vim.cmd

- vim.cmd("set notimeout") - this is a safety net, whatever string you pass as parameter to vim.cmd will be interpreted as VimL.
- For multiple lines, wrap string in double brackets

```lua
vim.cmd([[
set notimeout
set encoding=utf-8
]])
```
