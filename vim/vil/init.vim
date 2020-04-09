if ! filereadable(expand('~/.local/share/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.local/share/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

""" Plugins and vim-plug   {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'aonemd/kuroi.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'vifm/vifm.vim'
Plug 'elentok/plaintasks.vim'
Plug 'liuchengxu/space-vim-dark'
" Highlight Yanked String
Plug 'machakann/vim-highlightedyank'
Plug 'ap/vim-css-color'                           " Color previews for CSS
Plug 'vimwiki/vimwiki'
Plug 'kovetskiy/sxhkd-vim'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'

call plug#end()
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load config modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable Python 2 support:
let g:loaded_python_provider = 0

source $HOME/.dotfiles/vim/vil/Sinit.vim
"source $HOME/.config/nvim/general.vim
"source $HOME/.config/nvim/plugins.vim
"source $HOME/.config/nvim/keys.vim
source $HOME/.dotfiles/vim/vil/Snippets.vim
" load local.vim environment specific config if it exists
if !empty(glob("~/.local.vim"))
    source $HOME/.local.vim
endif

