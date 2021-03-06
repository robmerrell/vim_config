"""""" Vundle """"""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'nanotech/jellybeans.vim'

" utils
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'chrisbra/NrrwRgn'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'bronson/vim-trailing-whitespace'

" languages and frameworks
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kchmck/vim-coffee-script'
Plugin 'JulesWang/css.vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'tpope/vim-rails'

" markdown
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'

call vundle#end()

filetype plugin indent on


"""""" System """""
set ch=1		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
let mapleader = ","
let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$'


""""""" Window """""""
syntax on
set vb
set guifont=Monaco:h12
set t_Co=256
set bg=dark
set number
set guioptions-=T
set nowrap

colorscheme jellybeans

" Declutter the tab label
set guitablabel=%t

" change syntax coloring of c strings
let c_comment_strings=1

" always show the status bar
:set laststatus=2

" highlight the current line
":set cursorline


"""""" Movement """""
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

"""""" Native """""""
:nmap <leader>e :Explore<CR>

" indent guides
let g:indent_guides_auto_colors = 0
let indent_guides_color_change_percent = 10
let indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=237

" ignore pattern for ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules)$'
:nmap <C-o> :CtrlPBuffer<CR>

" let supertab handle omnicomplete
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabClosePreviewOnPopupClose = 1

" airline theme
let g:airline_theme='murmur'

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

" use flavored markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" json
autocmd BufNewFile,BufRead *.json set filetype=javascript

" fugitive
au FileType gitcommit nmap <buffer> U :Git checkout -- <c-r><c-g><cr>

