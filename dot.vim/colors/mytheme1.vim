
" For using with urxvt/xterm -name theme-mytheme1

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mytheme1"

" For urxvt dark1 theme.
highlight MatchParen ctermbg=2 ctermfg=white

" For termite base16-default-dark theme.
"highlight MatchParen term=NONE ctermfg=0 ctermbg=1

highlight Visual ctermbg=234

" ctermbg a litte lighter than BG.
highlight Pmenu ctermbg=236 ctermfg=white

" ctermbg a little lighter than PmenuSel ctermbg.
highlight PmenuSel ctermbg=238 ctermfg=white

highlight Comment ctermfg=4

highlight Constant ctermfg=1

highlight Folded ctermbg=234

" orange
highlight ALEWarning ctermbg=202
highlight ALEError ctermbg=344

" :help hl-Search. It is also used for the current, selected line in
" the quickfix window (which syntastic uses).
highlight Search ctermbg=5 ctermfg=white

highlight SpellBad ctermbg=213

"
" GitGutter
"
highlight SignColumn      ctermfg=118 ctermbg=235
highlight FoldColumn      ctermfg=118 ctermbg=235

"
" ColorColumn works with cursorcolun to delimit max line length.
"
highlight ColorColumn term=NONE ctermbg=235

" vim: sw=2

