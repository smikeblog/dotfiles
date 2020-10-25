if ! filereadable(expand('~/.local/share/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.local/share/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

""" Plugins and vim-plug   {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'haorenW1025/floatLf-nvim'

Plug 'j5shi/CommandlineComplete.vim'
Plug 'voldikss/vim-floaterm'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tpope/vim-surround'
Plug 'aonemd/kuroi.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
"Plug 'vifm/vifm.vim'
Plug 'elentok/plaintasks.vim'
" Highlight Yanked String
Plug 'machakann/vim-highlightedyank'
" Plug 'ap/vim-css-color'                           " Color previews for CSS
" Plug 'vimwiki/vimwiki'
Plug 'kovetskiy/sxhkd-vim'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'laher/fuzzymenu.vim'
Plug 'SidOfc/mkdx'
Plug 'chrisbra/vim-zsh'

call plug#end()
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load config modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable python2 and set full path to python3
let g:loaded_python_provider=0
let g:python3_host_prog="/usr/bin/python3"

source $HOME/.dotfiles/vim/vil/Sinit.vim
"source $HOME/.config/nvim/general.vim
"source $HOME/.config/nvim/plugins.vim
"source $HOME/.config/nvim/keys.vim
source $HOME/.dotfiles/vim/vil/Snippets.vim

source $HOME/.dotfiles/vim/dot.vim/calendar.vim
" load local.vim environment specific config if it exists
if !empty(glob("~/.local.vim"))
    source $HOME/.local.vim
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Temporary for testing modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:Hexokinase_highlighters = ['foregroundfull']
" let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_highlighters = [ 'background', 'backgroundfull', 'virtual']

let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\ ]

" let g:Hexokinase_refreshEvents = ['BufWrite', 'BufRead', 'TextChanged', 'InsertLeave']
" let g:Hexokinase_prioritizeHead = 0
" let g:Hexokinase_highlighters = ['sign_column']
" let g:Hexokinase_refreshEvents = ['TextChangedI', 'TextChanged']

function! s:FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run(fzf#wrap({'source': suggestions, 'sink': function("s:FzfSpellSink"), 'down':10}))
endfunction

nnoremap z= :call FzfSpell()<CR>

