"                                 ___
"        ___        ___          /__/\
"       /__/\      /  /\        |  |::\
"       \  \:\    /  /:/        |  |:|:\
"        \  \:\  /__/::\      __|__|:|\:\
"    ___  \__\:\ \__\/\:\__  /__/::::| \:\
"   /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
"   \  \:\|  |:|     \__\::/  \  \:\
"    \  \:\__|:|     /__/:/    \  \:\
"     \__\::::/      \__\/      \  \:\
"         ~~~~                   \__\/

let g:VimTemplates_beamer_name='slides.tex'

set guioptions=

 " Set compatibility to Vim only.
set nocompatible

"Always show current position
set ruler

" Turn on syntax highlighting.
syntax on

" Turn off modelines
set modelines=0

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Default Folding marker
set foldmethod=marker

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Display options
set showmode
set showcmd
set cmdheight=1

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

"set fillchars=diff:⣿,vert:│
set fillchars=diff:⣿,vert:\|

" Show line numbers
set number relativenumber
highlight LineNr ctermfg=darkgray

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text
" 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" -----------------------------------------------------------------------------
" Status line  from: https://github.com/nickjj/dotfiles/blob/master/.vimrc
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

" -----------------------------------------------------------------------------

""""""=== Y >,< <l>rc <l>cc <l>s ===================================== {{{

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" In command mode (i.e. after pressing ':'), expand %% to the path of the current
" buffer. This allows you to easily open files from the same directory as the
" currently opened file.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

" Allows you to easily change the current word and all occurrences to something
" else. The difference between this and the previous mapping is that the mapping
" below pre-fills the current word for you to change.
nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

" Sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>

""""""======================================== }}}
" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

function! OpenUrlUnderCursor()
    let url=matchstr(getline("."), '[a-z]*:\/\/[^>,;]*')
    if url != ""
        silent exec "!xdg-open '".url."'" | redraw!
    endif
endfunction
map <leader>o :call OpenUrlUnderCursor()<CR>

"next function is from https://github.com/FuDesign2008/OpenUrl.vim/blob/master/after/plugin/openUrl.vim
function! OpenUrlUndCursor()
    let text=matchstr(getline("."), '[a-z]*:\/\/[^>,;]*')
    let url = matchstr(text, '[A-Za-z]\{3,9\}:\(\/\{2,3\}\)\?[A-Za-z0-9\.\-;:&=+\$,\w~%\/\!?#_]\+')
        if !strlen(url)
            "www.
            let url = matchstr(text, 'www\.[A-Za-z0-9\.\-;:&=+\$,\w~%\/\!?#_]\+')
            if strlen(url)
                let url = 'http://' . url
            endif
        endif
    if url != ""
        silent exec "!xdg-open '".url."'" | redraw!
    endif
endfunction
map <leader>l :call OpenUrlUndCursor()<CR>

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile *.{cal,md,rmd,Rmd} set filetype=markdown
autocmd BufRead,BufNewFile .{zshrc,zshfunc}.custom set filetype=sh

" source dracula theme
source ~/.dotfiles/vim/dot.vim/colors/dracula.vim

" source calendar & diary script
source ~/.dotfiles/vim/dot.vim/calendar.vim

source ~/.fzf/plugin/fzf.vim 

