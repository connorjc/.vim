" Connor Christian Vim8

" Dependencies
" cpp, pylint, gcc, lynx, shellcheck

" Standard Vim
" Colors {{{
colorscheme happy_hacking " Default colorscheme
syntax on                 " Set Colors
filetype plugin on        " Check filetype configs
if &term =~ '256color'    " Enable 256color
	set t_ut=
endif
" }}}

" 80 Character Line Limit {{{
highlight OverLength ctermbg=gray ctermfg=black guibg=#592929
match OverLength /\%81v.\+/
set textwidth=80   " Auto indent text past 80 characters
set fo-=t
set nowrap         " Actually indent; no wrap around
" }}}

" Searching {{{
set incsearch " Search as characters are entered
set hlsearch  " Highlight search results
set wildmenu  " visual autocomplete for command menu
" }}}

" Line Tracking/Navigation {{{
set ruler                      " Always show rows/columns
set number                     " Enable line numbers
set cursorline                 " Highlight current line
set mouse=a                    " Mouse enable
set backspace=indent,eol,start " Fix backspace
" }}}

" Netrw {{{
let g:netrw_banner = 0    " Disable unneeded 'help' banner
let g:netrw_liststyle = 3 " unfold subdirectires
" }}}

" Leader Shortcuts {{{
" Shortcuts to edit and source vimrc
nnoremap \ev :sp $MYVIMRC<CR>>
nnoremap \sv :source $MYVIMRC<CR>>

" save session
nnoremap <leader>s :mksession<CR>>

" Snippets
nnoremap \html :-1read $HOME/.vim/.skeleton.html<CR>>
nnoremap \tex :-1read $HOME/.vim/.skeleton.tex<CR>>
nnoremap \cpp :-1read $HOME/.vim/.skeleton.cpp<CR>>
nnoremap \python :-1read $HOME/.vim/.skeleton.python<CR>>
nnoremap \pl :-1read $HOME/.vim/.skeleton.pl<CR>>
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
Plug 'w0rp/ale'                                               "async linting
Plug 'mjbrownie/browser.vim'                                  "lynx support
Plug 'chrisbra/csv.vim'                                       "enhanced csv support
Plug 'junegunn/goyo.vim'                                      "distraction free r/w
Plug 'yggdroot/indentline'                                    "shows indents
Plug 'itchyny/lightline.vim'                                  "minimal status bar
Plug 'iamcco/markdown-preview.vim'                            "live markdown preview
Plug 'nightsense/night-and-day'                               "dynamic colorschemes
Plug 'majutsushi/tagbar' | Plug 'stephenmckinney/vim-autotag' "ctag support
Plug 'ntpeters/vim-better-whitespace'                         "easy whitespace strip
Plug 'flazz/vim-colorschemes'                                 "colorschemes
Plug 'tpope/vim-commentary'                                   "enhanced commenting
Plug 'tpope/vim-fugitive'                                     "git support
Plug 'tommcdo/vim-lion'                                       "easy alignment
Plug 'aaronbieber/vim-quicktask'                              "todo list support
call plug#end()
" }}}

" IndentLine {{{
let g:indentLine_char = "|"
let g:indentLine_conceallevel = 1
" }}}

" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
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

" Night-and-Day {{{
let g:nd_themes = [
  \ ['sunset+25/28',	'seoul256',        'dark',	'seoul256'	],
  \ ['sunrise+0',	'seoul256',        'light',	'seoul256'	],
  \ ['sunset+0',	'seoul256',        'dark',	'seoul256'	],
  \ ['sunset+3/28',	'hybrid_material', 'dark',	'deus'	],
  \ ]
let g:nd_latitude = '30'                     " Tallahassee Latitude
if strftime("%m") > 2 && strftime("%m") < 10 " Account for DST by adjusting min offset
  let g:nd_timeshift = '95'
else
  let g:nd_timeshift = '35'
endif
let g:nd_lightline = 1                       " Update Lightline theme
" }}}

" Markdown-Preview {{{
let g:mkdp_path_to_chrome = "firefox" " Command to open preferred browser
" }}}

" Vim-Better-Whitespace {{{
let g:better_whitespace_ctermcolor='yellow'
" }}}

" Vim-Lion {{{
let g:lion_squeeze_spaces = 1 " Choose minimal amount of spaces
" }}}

" vim:foldmethod=marker:foldlevel=0
