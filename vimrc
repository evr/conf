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

"-------------------------------------
"User Interface

set so=5 "when moving vertical, set 7 lines to the curors
set wildmenu

set cmdheight=2 "Commandbar height

set hlsearch "Highlight search things
set showmatch

"-------------------------------------
"Visual Mode
"In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"The following code is from http://amix.dk/vim/vimrc.html"
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"-------------------------------------
"Text, tab and indent
set tabstop=4
set shiftwidth=4
set autoindent
set softtabstop=4
set expandtab

"-------------------------------------
"sth 4 convenience
imap jj <esc>
map <C-A> ggVG
map <C-C> "+y
cnoremap <C-J> <Home>
cnoremap <C-E> <End>
cnoremap <C-I> <Up>
cnoremap <C-K> <Down>

"-------------------------------------
"Tab
"map <leader>nn :tabnew<cr>
"map <leader>cc :tabclose<cr>
"map <leader>ee :tabn<cr>

"-------------------------------------
"Auto Complete
inoremap (  ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap ' ''<esc>i
inoremap " ""<esc>i
"inoremap < <><esc>i

"-------------------------------------
"Coding
map <leader>cc :botright cope<CR>
map <leader>n :cn<CR>
map <leader>p :cp<CR>

autocmd FileType c,cpp,java :set cindent
autocmd FileType c,cpp :map <F5> :make %< <CR>
autocmd FileType c,cpp :map <F6> :!./%< <CR>

"-------------------------------------
"LaTeX & Markdown
autocmd FileType tex :map <F5> :!latex % && dvipdf %:r.dvi <CR>
autocmd FileType tex :map <F6> :!evince %:r.pdf <CR>
autocmd FileType markdown :map <F5> :!pandoc % -o %:r.pdf --latex-engine xelatex --template=/home/omega/Template/pandoc.latex <CR>

"-------------------------------------
"Dictionary
map <leader>k :!dict <cword> -d wn && ~/newword.sh <cword><CR>
vmap <leader>j "zdi<C-R>z<ESC>:!dict <C-R>z -d wn && ~/newword.sh <C-R>z<CR>

"-------------------------------------
"encoding
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1,big5 " 如果要打开的文件编码不在此列，那就添加进去
set termencoding=utf-8""

"-------------------------------------
"misc
set completeopt=longest,menu
set number
set incsearch
autocmd FileType make :set noexpandtab
