"------------------------------------"
"General
set history=700

filetype plugin indent on

" autoread when a file is changed from outside
set autoread
let mapleader=","
let g:mapleader=","
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
"------------------------------------"
"User Interface
"when moving vertical, set 7 lines to the curors
set so=5
set wildmenu
set ruler "Always show current position
set cmdheight=2 "Commandbar height

set hlsearch "Highlight search things
set showmatch
"------------------------------------"
"Visual Mode Related
"In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"------------------------------------"
"Text, tab and indent
set tabstop=4
set shiftwidth=4
set autoindent
set softtabstop=4
set expandtab

"------------------------------------"
"sth 4 convenience
imap jj <esc>
map <C-A> ggVG
map <C-C> "+y
cnoremap <C-J> <Home>
cnoremap <C-E> <End>
cnoremap <C-I> <Up>
cnoremap <C-K> <Down>

"------------------------------------"
"Tab
map <leader>nn :tabnew<cr>
map <leader>cc :tabclose<cr>
map <leader>ee :tabmove
"-----------------------------------"
"Auto Complete
inoremap (  ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap ' ''<esc>i
inoremap " ""<esc>i
"inoremap < <><esc>i

set number
set incsearch
autocmd FileType make :set noexpandtab
autocmd FileType c,cpp,java :set cindent
autocmd FileType c,cpp :map <F5> :make %< <CR>
autocmd FileType c,cpp :map <F6> :!./%< <CR>
autocmd FileType markdown :map <F5> :!pandoc % -o %:r.pdf --latex-engine xelatex --template=/home/omega/Template/pandoc.latex <CR>
autocmd FileType tex :map <F5> :!latex % && dvipdf %:r.dvi <CR>
autocmd FileType tex :map <F6> :!evince %:r.pdf <CR>
map <leader>k :!dict <cword> -d wn && ~/newword.sh <cword><CR>
vmap <leader>j "zdi<C-R>z<ESC>:!dict <C-R>z -d wn && ~/newword.sh <C-R>z<CR>
set completeopt=longest,menu
"---------------------------------
"Code
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1,big5 " 如果你要打开的文件编码不在此列，那就添加进去
set termencoding=utf-8""
