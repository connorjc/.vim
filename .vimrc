" Connor Christian Vim8

" Dependencies {{{
" w0rp/ale:
" gcc, cpplint, pylint, javac, shellcheck
"
" mjbrownie/browser:
" lnyx
" }}}

" Standard Vim
" Colors {{{
set t_Co=256                   " Enable 256color
set background=dark	       " Use dark theme
syntax on                      " Set Colors
filetype plugin indent on      " Check filetype configs
function! ToggleBG()           " Switch between favorite dark and light themes
  if &background == "dark"
    set background=light
    colorscheme seoul256-light
  else
    set background=dark
    colorscheme hybrid_material
  endif
endfunction
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
set ruler                      " Always show rows/columns
set nu rnu                     " Enable hybrid line numbers
set cursorline                 " Highlight current line
set mouse=a                    " Mouse enable
set backspace=indent,eol,start " Fix backspace
set scrolloff=3                " Minimum lines to pad cursor when scrolling
" }}}

" Netrw - Directory Browsing {{{
let g:netrw_banner = 0         " Disable unneeded 'help' banner
let g:netrw_liststyle = 3      " unfold subdirectires
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
nnoremap <leader>pl     :-1read $HOME/.vim/.skeleton.pl<CR>>
" }}}

" Plugins
" Vim-Plug {{{
" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Declare plugins
call plug#begin('~/.vim/pack/plugins/start')
Plug 'w0rp/ale'                                               "Async linting
Plug 'mjbrownie/browser.vim'                                  "Lynx support
Plug 'chrisbra/csv.vim'                                       "Enhanced csv support
Plug 'junegunn/goyo.vim'                                      "Distraction free r/w
Plug 'yggdroot/indentline'                                    "Shows indents
Plug 'itchyny/lightline.vim'                                  "Minimal status bar
Plug 'iamcco/markdown-preview.vim'                            "Live markdown preview
Plug 'majutsushi/tagbar' | Plug 'stephenmckinney/vim-autotag' "Ctag support
Plug 'mbbill/undotree'                                        "Better undo history
Plug 'ntpeters/vim-better-whitespace'                         "Easy whitespace strip
Plug 'flazz/vim-colorschemes'                                 "Colorschemes
Plug 'tpope/vim-commentary'                                   "Enhanced commenting
Plug 'tpope/vim-fugitive'                                     "Git support
Plug 'tommcdo/vim-lion'                                       "Easy alignment
Plug 'aaronbieber/vim-quicktask'                              "Todo list support
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
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
set laststatus=2
set noshowmode
" }}}

" Markdown-Preview {{{
let g:mkdp_path_to_chrome = "firefox"       " Command to open preferred browser
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
