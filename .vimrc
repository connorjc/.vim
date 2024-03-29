" Connor Christian Vim8

" Dependencies {{{
" w0rp/ale:
"   * cpp:
"     + gcc
"     + cpplint
"
"   * python3:
"     + pylint
"
"   * java:
"     + javac
"
"   * bash:
"     + shellcheck
"
"   * html:
"     + tidy
"
"   * LaTex:
"     + lacheck
"
" mjbrownie/browser:
"   * lnyx
" }}}

" Standard Vim
" Colors {{{
set t_Co=256                   " Enable 256color
set background=dark	       " Use dark theme
colorscheme hybrid_material    " Default colorscheme
syntax on                      " Set Colors
filetype plugin indent on      " Check filetype configs
" }}}

" 80 Character Line Limit {{{
highlight OverLength ctermbg=gray ctermfg=black guibg=#592929
match OverLength /\%81v.\+/    " Highlight text over line limit
set textwidth=80               " Auto indent text past 80 characters
set fo-=t                      " Disable automatic textwidth formatting
set nowrap                     " Actually indent; no wrap around
" }}}

" Searching {{{
set incsearch                  " Search as characters are entered
set hlsearch                   " Highlight search results
set wildmenu                   " visual autocomplete for command menu
" }}}

" UI {{{
set guifont=Monaco:h14         " Set font and size for MacVim
set ruler                      " Always show rows/columns
set nu rnu                     " Enable hybrid line numbers
set cursorline                 " Highlight current line
set mouse=a                    " Mouse enable
set backspace=indent,eol,start " Fix backspace
set scrolloff=3                " Minimum lines to pad cursor when scrolling
" }}}

" Undo {{{
call system('mkdir -p ' . '~/.vim/undo') " Create undo directory incase it doesn't exist
set undofile                             " Save undos after file closes
set undodir=~/.vim/undo                  " Save undos here to uncluter filesystem
" }}}

" Netrw - Directory Browsing {{{
let g:netrw_banner = 0                                   " Disable unneeded 'help' banner
let g:netrw_liststyle = 3                                " Unfold subdirectires
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' " Add line numbers
" }}}

" Functions {{{
function! ToggleBG()           " Switch between favorite dark and light themes
  let s:tbg = &background
  if s:tbg == "dark"
    set background=light
    colorscheme seoul256-light
  else
    set background=dark
    colorscheme hybrid_material
  endif
endfunction

let clock = strftime("%I:%M:%S %p")
function! SetTime(timer)
  let g:clock = strftime("%I:%M:%S %p")
  call lightline#update()
endfunction

function! GetTime()
  return g:clock
endfunction
let timer = "default" 

function! MarkdownLevel()
  " if getline(v:lnum) =~ '^# .*$'
  "   return ">1"
  " endif
  if getline(v:lnum) =~ '^## .*$'
    return ">2"
  endif
  if getline(v:lnum) =~ '^### .*$'
    return ">3"
  endif
  if getline(v:lnum) =~ '^#### .*$'
    return ">4"
  endif
  if getline(v:lnum) =~ '^##### .*$'
    return ">5"
  endif
  if getline(v:lnum) =~ '^###### .*$'
    return ">6"
  endif
  return "=" 
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr 
" }}}

" Leader Shortcuts {{{
" Edit and source vimrc
nnoremap <leader>ev :sp $MYVIMRC<CR>>
nnoremap <leader>sv :source $MYVIMRC<CR>>

" Toggle colorscheme
nnoremap <leader>bg :call ToggleBG()<CR>>

" Paste code skeletons
nnoremap <leader>html   :-1read $HOME/.vim/.skeleton.html<CR>>
nnoremap <leader>tex    :-1read $HOME/.vim/.skeleton.tex<CR>>
nnoremap <leader>cpp    :-1read $HOME/.vim/.skeleton.cpp<CR>>
nnoremap <leader>python :-1read $HOME/.vim/.skeleton.python<CR>>
" }}}

" Plugins
" Vim-Plug {{{
" Auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Declare plugins
call plug#begin('~/.vim/pack/plugins/start')
Plug 'w0rp/ale'                                               "Async linting
Plug 'mjbrownie/browser.vim'                                  "Lynx support
Plug 'chrisbra/csv.vim'                                       "Enhanced csv support
Plug 'ctrlpvim/ctrlp.vim'                                     "Fuzzy Finder
Plug 'junegunn/goyo.vim'                                      "Distraction free r/w
Plug 'yggdroot/indentline'                                    "Shows indents
Plug 'itchyny/lightline.vim'                                  "Minimal status bar
Plug 'maximbaz/lightline-ale'                                 "Ale stats in status bar
Plug 'majutsushi/tagbar' | Plug 'stephenmckinney/vim-autotag' "Ctag support
Plug 'mbbill/undotree'                                        "Better undo history
Plug 'ntpeters/vim-better-whitespace'                         "Easy whitespace strip
Plug 'ap/vim-css-color'                                       "Preview CSS Colors
Plug 'flazz/vim-colorschemes'                                 "Colorschemes
Plug 'tpope/vim-commentary'                                   "Enhanced commenting
Plug 'tpope/vim-fugitive'                                     "Git support
Plug 'jmcantrell/vim-virtualenv'                              "Virtual Env support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }            "Golang support
Plug 'tommcdo/vim-lion'                                       "Easy alignment
Plug 'aaronbieber/vim-quicktask'                              "Todo list support
Plug 'tpope/vim-surround'                                     "Enhanced surroundings
" Plug 'xuhdev/vim-latex-live-preview'                          "Live LaTex preview
" Plug 'iamcco/markdown-preview.vim'                            "Live markdown preview
call plug#end()
" }}}

" IndentLine {{{
let g:indentLine_char = "|"
let g:indentLine_conceallevel = 1
" }}}

" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [  'gitbranch', 'venv', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'venv': 'virtualenv#statusline',
      \   'clock': 'GetTime',
      \ },
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
set laststatus=2
set noshowmode

" if exists("g:loaded_lightline")
"   let g:timer = timer_start(1000, 'SetTime',{'repeat':-1})
" endif
" }}}

" Markdown-Preview {{{
if has('mac')
  let g:mkdp_path_to_chrome = "open -a Firefox"       " Command to open preferred browser
else
  let g:mkdp_path_to_chrome = "firefox"       " Command to open preferred browser
endif
" }}}

" Undotree {{{
let g:undotree_WindowLayout=2               " Tree on left margin and diff on bottom
" }}}

" Vim-Better-Whitespace {{{
let g:better_whitespace_ctermcolor='yellow' " Highlight trailing whitespace yellow
" }}}

" Vim-Lion {{{
let g:lion_squeeze_spaces = 1               " Choose minimal amount of spaces
" }}}

" vim:foldmethod=marker:foldlevel=0
