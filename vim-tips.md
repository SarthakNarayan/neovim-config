## Visual Block Change (Multi Cursor edit)

- If the things you want to change are neatly aligned with each other, you can make a Visual Block change
- <C-v>, I (to insert)
- After you exit from insert mode you will be able to see your changes

## How to replace multiple occurrences of the same word

- If you want to combine the power of Vim's search with the dot operator, that's perfectly possible.
- Let's say you searched for "/ruby\|php\|python\|javascript\|java" and want to replace some of the matches with Haskell.
- Just jump to the first one using `n` and replace it using the `gn` text object, like this: `cgn` type Haskell and then hit <Esc>.
- Since `cgn` is a command, we can now use `.` the dot operator to repeat that.
- If you want to **skip an occurrence** or undo what you did you can use `n` and `u` respectively.

## Search and Replace

- `:%s/search goes here/replace goes here/g` - search and replace in whole file
- `:s/search goes here/replace goes here/g` - if you are in _visual selection_
- Now, this is really nice, but you might want to skip some matches, or you want to be sure that you don't replace matches that you didn't want to replace.
  - You can use the `c` modifier to your search, and Vim will ask you to confirm every match using y or n.
  - E.g.: `:%s/search goes here/replace goes here/gc` - search and replace in whole file and ask for confirmation for each replace

## Vim Recording

- All the recorded macros are stored in registers
- Tips

  - Try going to the beginning of line using symbols,
  - Using search to jump to brackets or words,
  - Try not to use h,j,k,l and other keys which might not be repeatable.

- q<register> : to start the macro
- q : to end the macro
- @<register> : to run the macro
- @@ : to repeat the macro
- 10@<register> : repeat the macro 10 times
- :reg <register> : To view the contents of the register
- To clear a single macro - record over it - with nothing.

  - Example qw, q : macro at register w will be overwritten
  - Or we can do `:let @<register> = ''`

- What happens if you use `100@<name>` and there are only 50 lines
  - Vim will stop running recursive macros if there are no lines to run it on.

## See the latest commands

- q:

## Select between brackets

- vi{ -> Brackets are not included
- va{ -> Brackets are included
