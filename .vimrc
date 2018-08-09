set nocompatible
filetype off

" vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"unhighight after search
Plugin 'romainl/vim-cool'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
"html
"  isnowfy only compatible with python not python3
"Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'bling/vim-airline'
"python sytax checker
"Plugin 'nvie/vim-flake8'
"Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'drewtempelmeyer/palenight.vim'

"auto-completion stuff
"Plugin 'klen/rope-vim'
""code folding
Plugin 'tmhedberg/SimpylFold'
"writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
"
"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

call vundle#end()
" }}}

" quick interactions {{{
" easy splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move through paragraphs easier
map j gj
map k gk

" autoclose parens etc
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" use jj for easy esc
imap jj <Esc>

" use enter to create blank line
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" }}}

" bind a key to toggle gundo window
nnoremap <C-g> :GundoToggle<CR>

" markdown
let g:goyo_width = 65
autocmd! User GoyoEnter Limelight0.7
autocmd! User GoyoLeave Limelight!
nnoremap <Leader>w :Goyo <ENTER>
" UI Config {{{
" show a visual line under the cursor's current line
set cursorline
" Makes sure lines break on whole words
set linebreak
" Keep cursor away from edges
set scrolloff=3
set foldcolumn=1

" colors
if (has("termguicolors"))
	  set termguicolors
endif
set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1

set guifont=Monaco:h14
"toggle color change
call togglebg#map("<F5>")
"
"turn on numbering
set number
set relativenumber

" Turn off relative numbring
nnoremap <Leader>n :set relativenumber! number!<ENTER>
" }}}

" plugin settings{{{

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

" nerdtree setups
map <C-e> :NERDTreeToggle<cr>
imap <C-e> <esc>:NERDTreeToggle<cr>i
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0

" fugitive git bindings
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>ga :Gwrite<CR>
nnoremap <space>gc :Gcommit<CR>
nnoremap <space>gd :Gvdiff<CR>
nnoremap <space>dp :diffput<CR>
nnoremap <space>do :diffget<CR>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>gp :Git push<Space>
nnoremap <space>gl :Git pull<Space>
" fugitive air-line fixes
" enable/disable fugitive/lawrencium integration >
let g:airline#extensions#branch#enabled = 1
" change the text for when no branch is detected >
let g:airline#extensions#branch#empty_message = ''
" use vcscommand.vim if available >
let g:airline#extensions#branch#use_vcscommand = 0
" truncate long branch names to a fixed length >
let g:airline#extensions#branch#displayed_head_limit = 10

" }}}

" Misc {{{
"copy to clipboard
set clipboard=unnamedplus

"set search settings
set incsearch
set ignorecase
set hlsearch
:let @/ = ""
" }}}

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
"au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
"highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
"let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 0                                                                                 
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode':'passive'}
nnoremap <F10> :SyntasticCheck<CR> :SyntasticToggleMode<CR> :w<CR>

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set foldlevel=99
"----------Stop python PEP 8 stuff--------------

