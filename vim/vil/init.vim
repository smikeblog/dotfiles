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
""" Plugins and vim-plug   {{{
call plug#begin('~/.local/share/nvim/pluvled')

" Add spelling errors to the quickfix list (vim-ingo-library is a dependency).
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'

Plug 'haorenW1025/floatLf-nvim'

Plug 'j5shi/CommandlineComplete.vim'
Plug 'voldikss/vim-floaterm'
" Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tpope/vim-surround'
Plug 'aonemd/kuroi.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf' ", { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
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
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'laher/fuzzymenu.vim'
Plug 'SidOfc/mkdx'
Plug 'kovetskiy/sxhkd-vim'
Plug 'chrisbra/vim-zsh'

"Plug 'glepnir/spaceline.vim'
"Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript
Plug 'bling/vim-airline'

call plug#end()
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load config modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.vil/general.vim
source $HOME/.dotfiles/vim/vil/Sinit.vim
source $HOME/.dotfiles/vim/vil/Snippets.vim

source $HOME/.dotfiles/vim/dot.vim/calendar.vim
" load local.vim environment specific config if it exists
if !empty(glob("~/.local.vim"))
    source $HOME/.local.vim
endif

source $HOME/.fzf/plugin/fzf.vim

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


" Toggle quickfix window.
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
nnoremap <silent> <Leader>tq :call QuickFix_toggle()<CR>

