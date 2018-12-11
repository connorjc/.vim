" Super Vim!

" Set Colors
syntax on
let g:nd_themes = [
  \ ['sunrise+0',   'seoul256',        'dark' ],
  \ ['sunrise+1/2', 'seoul256',        'light'],
  \ ['sunset+0',    'seoul256',        'dark' ],
  \ ['sunset+1/2',  'hybrid_material', 'dark' ],
  \ ]
let g:nd_latitude = '30'
if strftime("%m") > 2 && strftime("%m") < 10
  let g:nd_timeshift = '95'
else
  let g:nd_timeshift = '35'
endif

" Highlight 80 character
highlight OverLength ctermbg=gray ctermfg=black guibg=#592929
match OverLength /\%81v.\+/
set textwidth=80
set fo-=t
set nowrap

set hlsearch		" Highlight search results

" IndentLine
let g:indentLine_char = "|"
let g:indentLine_conceallevel = 1

" Vim-Airline
set laststatus=2
set noshowmode

filetype plugin on	" Check filetype configs

set ruler		" Always show rows/columns
set number		" Enable line numbers
set mouse=a		" Mouse enable
set wildmenu

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
