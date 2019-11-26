
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

let colors_name  =  'mylight1'

"highlight MatchParen ctermbg = 2 ctermfg = white

" For termite base16-default-dark theme.
"highlight MatchParen term = NONE ctermfg = 0 ctermbg = 1

highlight Visual ctermbg = 253
highlight PmenuSel ctermbg = 13 ctermfg = white

" quickfix syntastic error
" 202: yellowish
highlight Search ctermbg = 202

highlight Comment ctermfg = 4
highlight Constant ctermfg = 1
highlight Folded ctermbg = 250

" :help hl-Search. It is also used for the current, selected line in
" the quickfix window (which syntastic uses).
highlight Search ctermbg = 1 ctermfg = white

" 15 almost white
" 248 grayish
" 249 lighter than 248
let g:indentLine_color_term = 249

" vim: sw=2
