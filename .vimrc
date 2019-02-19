set ignorecase" basiet config
set backspace=indent,eol,start
" {{{
set nocompatible
filetype plugin on
filetype indent on      " load filetype-specific indent files
set relativenumber    " show relative line number
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set number
set wrap
" }}}

" abbrevations
iabbrev @@ zhuhh2@shanghaitech.edu.cn

" auto command
" {{{
augroup filtype_related
    au!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
augroup END
" }}}

" text object remap
:onoremap il( :<c-u>normal! F)vi(<cr>
:onoremap in( :<c-u>normal! f(vi(<cr>

" Vimscript file settings
" {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Space and Tab
set softtabstop=2  " number of spaces in tab when editing
set expandtab       " tabs are spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set textwidth=79
set fileformat=unix
set formatoptions+=t

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
nnoremap ,<space> :nohlsearch<CR>      " ,<space> to close search highlight
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
nnoremap <leader>o  :only<CR>
nnoremap <leader>v  :sp<CR>
nnoremap <leader>h  :vs<CR>
nnoremap <leader>q  <C-W>q
nnoremap <leader>e  :e 
nnoremap <c-u> viwU
inoremap <c-u> <esc>viwU

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

"ale settings
"let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_linter_alias = {'wxml': 'html', 'wxss': 'css'}
let g:ale_open_list = 1 
" python checker
"let g:syntastic_python_checkers=['pylint']
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    au BufNewFile,BufRead *.wxml .vue set filetype=html
    au BufNewFile,BufRead *.wxss set filetype=css
augroup END

" vue setting
autocmd FileType javascript,html,css,xml set ai
autocmd FileType javascript,html,css,xml set sw=2
autocmd FileType javascript,html,css,xml set ts=2
autocmd FileType javascript,html,css,xml set sts=2
autocmd FileType javascript,html,css,xml set expandtab

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'css': ['stylelint'],
\   'html': ['tidy'],
\   'jsx': ['stylelint', 'eslint']
\}

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
" javascript checker
"let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'
"let g:syntastic_javascript_checkers=['standard']

" localtion list setting
nnoremap <leader>c  :lclose<CR>
nnoremap <leader>L  :Errors<CR>

" toggle nerdtree
nnoremap <leader>tn :NERDTreeToggle<CR>

"colorschema config
syntax on
"color dracula
color monokai

" ctrp settings
"nnoremap <leader>p  :"CtrlP<CR>
"nnoremap <leader>b  :CtrlPBuffer<CR>
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = ''
"" let g:ctrlp_user_command = 'ag %s -l --nocolor  --hidden -g ""'

" UltiSnips settings
let g:UltiSnipsExpandTrigger= '<leader><tab>'

" emmet settgins
" let g:user_emmet_settings = {
\  'html' : {
\    'indentation' : '  '
\  }
\}
let g:user_emmet_leader_key = ','
let g:user_emmet_settings = {
  \ 'wxss': {
  \   'extends': 'css',
  \ },
  \  'html' : {
  \    'indentation' : '  '
  \  },
  \ 'wxml': {
  \   'extends': 'html',
  \   'aliases': {
  \     'div': 'view',
  \     'span': 'text',
  \   },
  \  'default_attributes': {
  \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
  \     'navigator': [{'url': '', 'redirect': 'false'}],
  \     'scroll-view': [{'bindscroll': ''}],
  \     'swiper': [{'autoplay': 'false', 'current': '0'}],
  \     'icon': [{'type': 'success', 'size': '23'}],
  \     'progress': [{'precent': '0'}],
  \     'button': [{'size': 'default'}],
  \     'checkbox-group': [{'bindchange': ''}],
  \     'checkbox': [{'value': '', 'checked': ''}],
  \     'form': [{'bindsubmit': ''}],
  \     'input': [{'type': 'text'}],
  \     'label': [{'for': ''}],
  \     'picker': [{'bindchange': ''}],
  \     'radio-group': [{'bindchange': ''}],
  \     'radio': [{'checked': ''}],
  \     'switch': [{'checked': ''}],
  \     'slider': [{'value': ''}],
  \     'action-sheet': [{'bindchange': ''}],
  \     'modal': [{'title': ''}],
  \     'loading': [{'bindchange': ''}],
  \     'toast': [{'duration': '1500'}],
  \     'audio': [{'src': ''}],
  \     'video': [{'src': ''}],
  \     'image': [{'src': '', 'mode': 'scaleToFill'}],
  \   }
  \ },
  \}

" ag settings
nnoremap <leader>g  :Ag<space>
" youcompleteme settings
"let g:ycm_python_binary_path = 'python'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3.5'
let g:ycm_path_to_python_interpreter = '~/.pyenv/shims/python3.6'
let g:ctrlp_show_hidden = 1
set completeopt-=preview
let g:ycm_semantic_triggers = {
   \   'css': [ 're!^\s{4}', 're!:\s+' ],
   \ }
autocmd BufEnter *.wxss set filetype=css
autocmd BufEnter *.wxml set filetype=html

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>

nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" tagbar settings
nnoremap <leader>tt :TagbarToggle<CR>

" listtoggle settings
let g:lt_location_list_toggle_map = '<leader>tl'
let g:lt_quickfix_list_toggle_map = '<leader>tq'

" vimtex settings
let g:vimtex_complete_close_braces =  1
au VimEnter *.tex
    \  if !exists('g:ycm_semantic_triggers')
    \ |  let g:ycm_semantic_triggers = {}
    \ |endif
    \ |let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" leaderf settings
" {{{
noremap <leader>r :LeaderfMru<cr>
noremap <leader>m :LeaderfFunction!<cr>
" }}}

" use vim plug vim file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif


