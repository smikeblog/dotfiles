

" Install vim-plug if missing
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup VimPlugAutoInstall
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif
" ========================
call plug#begin('~/.local/share/nvim/plugins')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/goyo.vim'
Plug 'aonemd/kuroi.vim'
" Plug 'tpope/vim-rails'
" Plug 'fatih/vim-go'
" Plug 'mattn/emmet-vim'
call plug#end()

set lazyredraw                                     "lazily redraw screen while executing macros, and other commands
set ttyfast                                        "more characters will be sent to the screen for redrawing
set ttimeout                                       "time waited for key press(es) to complete...
set ttimeoutlen=50                                 " ...makes for a faster key response
set noswapfile                                     "disable swap files
set autoread                                       "automatically read changes in the file
set hidden                                         "hide buffers instead of closing them even if they contain unwritten changes
set backspace=indent,eol,start                     "make backspace behave properly in insert mode
set clipboard=unnamedplus                          "use system clipboard; requires has('unnamedplus') to be 1
"set wildmenu                                       "better menu with completion in command mode
"set wildmode=longest:full,full
set completeopt=longest,menuone,preview            "better insert mode completions
set nowrap                                         "disable soft wrap for lines
set scrolloff=2                                    "always show 2 lines above/below the cursor
set showcmd                                        "display incomplete commands
set laststatus=2                                   "always display the status bar
set number                                         "display line numbers
set cursorline                                     "highlight current line
set colorcolumn=81                                 "display text width column
set splitbelow                                     "vertical splits will be at the bottom
set splitright                                     "horizontal splits will be to the right
set autoindent                                     "always set autoindenting on
set formatoptions-=cro                             "disable auto comments on new lines
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "use two spaces for indentation
set incsearch                                      "incremental search highlight
set ignorecase                                     "searches are case insensitive...
set smartcase                                      " ..unless they contain at least one capital letter
set hlsearch                                       "highlight search patterns

autocmd! FileType c    setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd! FileType java setlocal ts=4 sts=4 sw=4 expandtab
autocmd! FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

set t_Co=256                        "enable 256 colors
set background=dark
colorscheme kuroi

"status line: modifiedflag, charcount, filepercent, filepath
set statusline=%=%m\ %c\ %P\ %f

"remove current line highlight in unfocused window
au VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * set cul
au WinLeave,FocusLost,CmdwinLeave * set nocul
"
"remove trailing whitespace on save
autocmd! BufWritePre * :%s/\s\+$//e

"The Leader
" let mapleader="\<Space>"
let mapleader=","

nnoremap ! :!
nnoremap <leader>w :w<cr>
"replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>
"toggle showing hidden characters
nnoremap <silent> <leader>s :set nolist!<cr>
"toggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>
"toggle RTL mode
nnoremap <silent> <leader>l :set rl!<cr>
"override system files by typing :w!!
cnoremap w!! %!sudo tee > /dev/null %
"remove search highlight
nmap <leader>hc :nohlsearch<CR>
" nmap <leader>q :nohlsearch<CR>

"move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

"keep text selected after indentation
vnoremap < <gv
vnoremap > >gv

"fzf
nnoremap <leader>p :FZF<cr>
nnoremap <leader>o :Lines<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>r :Buffers<cr>

" nnoremap \  :Ag<space>
" nnoremap \| :Ag <C-R><C-W><cr>:cw<cr>

"Ctags
set tags+=.git/tags
nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --extra=+f --exclude=.git,pkg --languages=-sql<cr><cr>

"GitGutter
nnoremap <c-N> :GitGutterNextHunk<CR>
nnoremap <c-P> :GitGutterPrevHunk<CR>
nnoremap <c-U> :GitGutterUndoHunk<CR>

nnoremap <leader>B :enew<cr>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
nnoremap <leader>bq :bp <bar> bd! #<cr>
nnoremap <leader>ba :bufdo bd!<cr>
"cycle between last two open buffers
nnoremap <leader><leader> <c-^>

"netrw
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'
nnoremap <leader>n :Lexplore<CR>

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"Goyo
nnoremap <leader>g :Goyo<cr>
if !exists('*s:goyo_leave')
  function s:goyo_leave()
    source $MYVIMRC
  endfunction
endif
autocmd! User GoyoLeave nested call <SID>goyo_leave()
