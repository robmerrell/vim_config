"""""" Vundle """"""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" color schemes
Bundle 'molokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'cschlueter/vim-wombat'
Bundle 'gregsexton/Muon'

" utils
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'chrisbra/NrrwRgn'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/paredit.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'samsonw/vim-task'
Bundle 'jceb/vim-orgmode'
Bundle 'terryma/vim-expand-region'

" languages
Bundle 'elixir-lang/vim-elixir'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'
Bundle 'dgryski/vim-godef'
Bundle 'lunaru/vim-less'
Bundle 'othree/html5-syntax.vim'

" markdown
Bundle 'tpope/vim-markdown'
Bundle 'jtratner/vim-flavored-markdown'

filetype plugin indent on


"""""" System """""
set ch=1		" Make command line two lines high
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

colorscheme Muon

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
:nmap <C-o> :CtrlPBuffer<CR>

" let supertab handle omnicomplete
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabClosePreviewOnPopupClose = 1

" airline theme
let g:airline_theme='bubblegum'

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

" golang
autocmd BufWritePre *.go Fmt "run :Fmt for go files on save
autocmd Filetype go setlocal ts=4 sw=4 noexpandtab
let g:godef_same_file_in_same_window=1
let g:godef_split=0

" python
autocmd Filetype python setlocal ts=4 sw=4 expandtab

" vim-tasks
autocmd BufNewFile,BufRead *.tasks  setfiletype task
:nmap <leader>a :call Toggle_task_status()<CR>

" test runner
:nmap <leader>t :! mix test<CR>

