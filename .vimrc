" Super Vim!

" Set Colors
syntax on
set background=dark
colorscheme hybrid_material

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
nnoremap \python :-1read $HOME/.vim/.skeleton.python<CR>>
nnoremap \cpp :-1read $HOME/.vim/.skeleton.cpp<CR>>

" fix backspace
set backspace=indent,eol,start

if &term =~ '256color'
	set t_ut=
endif
