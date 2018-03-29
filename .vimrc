" basic config
set nocompatible
filetype plugin on
filetype indent on      " load filetype-specific indent files
set relativenumber    " show relative line number
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.

" Space and Tab
set softtabstop=4  " number of spaces in tab when editing
set expandtab       " tabs are spaces
au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4     |
    \ set shiftwidth=4     |
    \ set textwidth=79     |
    \ set expandtab     |
    \ set autoindent     |
    \ set fileformat=unix     

" search settings
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldlevelstart=10   " open most folds by default

let mapleader=","       " leader is comma
let maplocalleader="\\"
" keymap settings
" jo is escape
inoremap jo <esc>
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>
" $/^ doesn't do anything
nnoremap ,<space> :nohlsearch<CR>      " ,<space> to close search hilight
nnoremap <space> za       "space open/closes folds
nnoremap j gj
nnoremap k gk
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>w  <C-W><C-K>
nnoremap <leader>s  <C-W><C-J>
nnoremap <leader>a  <C-W><C-h>
nnoremap <leader>d  <C-W><C-l>
nnoremap <leader>v  :sp<CR>
nnoremap <leader>h  :vs<CR>
nnoremap <leader>q  <C-W>q
nnoremap <leader>e  :e 

" plugin config
" lightline setting
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': 'I am writing shit...'
      \ },
      \ }

set laststatus=2

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" python checker
let g:syntastic_python_checkers=['pylint']

" javascript checker
"let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_javascript_checkers=['standard']

" localtion list setting
nnoremap <leader>c  :lclose<CR>
nnoremap <leader>L  :Errors<CR>

" toggle nerdtree
nnoremap <leader>t :NERDTreeToggle<CR>

"colorschema config
syntax on
colorscheme hemisu
"color dracula

" ctrp settings
nnoremap <leader>p  :CtrlP<CR>
nnoremap <leader>b  :CtrlPBuffer<CR>
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = ''
" let g:ctrlp_user_command = 'ag %s -l --nocolor  --hidden -g ""'

" ag settings
nnoremap <leader>g  :Ag<space>
" youcompleteme settings
let g:ycm_python_binary_path = 'python'
let g:ctrlp_show_hidden = 1

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>

nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vimtex settings
let g:vimtex_complete_close_braces =  1
au VimEnter *.tex
    \  if !exists('g:ycm_semantic_triggers')
    \ |  let g:ycm_semantic_triggers = {}
    \ |endif
    \ |let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" use vim plug vim file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

