"""""" Vundle """"""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'molokai'
Bundle 'vim-scripts/Liquid-Carbon'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'chrisbra/NrrwRgn'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-foreplay'

" snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"


filetype plugin indent on


"""""" System """""
set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
let mapleader = ","



""""""" Window """""""
syntax on
set vb
set guifont=Monaco:h12
set t_Co=256
set bg=dark
set number
set guioptions-=T
set nowrap

" colorscheme
if has('gui_running')
  colorscheme liquidcarbon
  let g:liquidcarbon_high_contrast=1
else
  colorscheme molokai
endif

" Declutter the tab label
set guitablabel=%t

" change syntax coloring of c strings
let c_comment_strings=1

" always show the status bar
:set laststatus=2

" highlight the current line
:set cursorline


"""""" Movement """""
" Tab key bindings
:map <S-h> gT 
:map <S-l> gt
:nmap <S-j> :tabfirst<CR>
:nmap <S-k> :tablast<CR>
map <leader>n :tabnew<CR>

" Window key bindings
:nmap <C-h> :wincmd h<CR>
:nmap <C-l> :wincmd l<CR>
:nmap <C-j> :wincmd j<CR>
:nmap <C-k> :wincmd k<CR>

" resize windows
map <leader>h :vertical resize -5<CR>
map <leader>l :vertical resize +5<CR>
map <leader>j :resize +5<CR>
map <leader>k :resize -5<CR>


"""""" Plugins """""
:nmap <leader>m :NERDTreeToggle<CR>

" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" indent guides
let g:indent_guides_auto_colors = 0
let indent_guides_color_change_percent = 10
let indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=237

" ignore pattern for ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules)$'


""""" Tabs """"""
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent
set expandtab
set backspace=start,indent



""""" Search """"
" Clear the search by pressing enter
function! ClearHighlight()
    let @/=""
endfunction
nnoremap <silent> <expr> <CR> ClearHighlight()

" Switch on search pattern highlighting.
set hlsearch


