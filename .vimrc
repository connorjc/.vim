" Super Vim!

" Plugins Config
" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" declare plugins
call plug#begin('~/.vim/pack/plugins/start')
Plug 'w0rp/ale'
Plug 'mjbrownie/browser.vim'
Plug 'yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'nightsense/night-and-day'
Plug 'majutsushi/tagbar'
Plug 'stephenmckinney/vim-autotag'
Plug 'tpope/vim-fugitive'
Plug 'aaronbieber/vim-quicktask'
Plug 'iamcco/markdown-preview.vim', {'for': 'md'}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
call plug#end()

" Night-and-Day
let g:nd_themes = [
  \ ['sunset+25/28',	'seoul256',        'dark',	'seoul256'	],
  \ ['sunrise+0',	'seoul256',        'light',	'seoul256'	],
  \ ['sunset+0',	'seoul256',        'dark',	'seoul256'	],
  \ ['sunset+3/28',	'hybrid_material', 'dark',	'jellybeans'	],
  \ ]
let g:nd_latitude = '30'
if strftime("%m") > 2 && strftime("%m") < 10
  let g:nd_timeshift = '95'
else
  let g:nd_timeshift = '35'
endif
let g:nd_lightline = 1

" Highlight 80 character
highlight OverLength ctermbg=gray ctermfg=black guibg=#592929
match OverLength /\%81v.\+/
set textwidth=80
set fo-=t
set nowrap

" IndentLine
let g:indentLine_char = "|"
let g:indentLine_conceallevel = 1

" Lightline
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
" End Plugins

" Markdown-Preview
let g:mkdp_path_to_chrome = "firefox"

syntax on 		" Set Colors
filetype plugin on	" Check filetype configs
set hlsearch		" Highlight search results
set ruler		" Always show rows/columns
set number		" Enable line numbers
set mouse=a		" Mouse enable
set wildmenu

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Snippets
nnoremap \html :-1read $HOME/.vim/.skeleton.html<CR>>
nnoremap \tex :-1read $HOME/.vim/.skeleton.tex<CR>>
nnoremap \cpp :-1read $HOME/.vim/.skeleton.cpp<CR>>
nnoremap \python :-1read $HOME/.vim/.skeleton.python<CR>>
nnoremap \pl :-1read $HOME/.vim/.skeleton.pl<CR>>

" fix backspace
set backspace=indent,eol,start

if &term =~ '256color'
	set t_ut=
endif
