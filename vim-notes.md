# Vim Notes

## Basic

* `w` -> word including punctuation.
* `W` -> WORD only word from space to space.
* `e` -> end of word
* `i` -> inner only text, without previous or next space.
* `a` -> around text, with previous or next space.
* `p` -> paragraph, the whole paragraph.
* `s` -> sentence
* `gU` -> make uppercase.
* `t` -> tag, HTML, XML
* `c` -> change, cit -> change inside the tag, goes to insert mode.
* `(,)` -> left or right parenthesis.
* `{,}` -> left or right curly braces.
* `[,]` -> left or right square brackets.
* `q:` -> open register of last entered commands.
* `q/` -> open register of last entered searches.

## Registers

* `:reg` list of registers
* `"add` delete current line and put to register 'a'. Can be used with `y` or
  `x`.

## Folding

* `zo` open fold
* `zc` close fold
* `za` toggle fold

## agroup

agroup for some group of things.TODO read more about it
agroup SomeGroup
    autocmd! " to remove all other
agroup END

## :set

set number (set nonumber) or toggle set number! for boolean properties
set number? to get value

set background=dark or set bg=dark for valued properties
set background to get value

can change multiple properties;
:set number! background=dark nowrap

## :setlocal

Same as set but set only for current buffer.

## Interesting sets

* `number!`
* `relativenumber!`
* `numberwith=1` " or bigger
* `textwidth=n` " 0 by default, n -> line where text will be forced to wrap
* `wrap` " or nowarp or toggle wrap!
* `linebreak` " breaks text better on wrap
* `showbreak=<\`  " shows with set sign where text is wrapped.
* `scrolloff=5` will always show first and list n numbers while scrolling.
* `showmode` shows mode in status bar insert, visual,...
* `wildmenu` kind of autocomplete list when using `:`
* `undofile` set possibility to undo things after the file is closed and
  re-open.
* `gdefault` sets /g by default in search :%s/.

## Other

* `:w filename` -> creates duplicate file, but stay in original, maybe ok for
  backup state files.
* `:saveas filname` -> saves current filo to new one and changes to new one.

spellcheck

F6 set in .vimrc set spell!
:set spell! spelllang=hr

* `]s` -> next occurrence of misspelled word
* `[s` -> previous occurrence of misspelled word and those written in English UK or USA.
* `S` -> occurrence of misspelled word.
* `zg` -> add word to dictionary.
* `zug` -> undo previous add to dictionary.

From infinity to beyond. As we stay there. Hell yeah!

function name(string arg1, string arg2) {
    int var = 0;
}
