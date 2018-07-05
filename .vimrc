"run this command if having trouble using w/ py2
"sudo apt install vim-nox-py2

"vundle
set nocompatible
filetype off

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

"Plugin 'ajh17/VimCompletesMe'
" easy splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" bind a key to toggle gundo window
nnoremap <C-g> :GundoToggle<CR>

" use jj for easy esc
imap jj <Esc>

" use enter to create blank line
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" show a visual line under the cursor's current line
set cursorline

"auto-completion stuff
"Plugin 'klen/python-mode'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

call vundle#end()

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"copy to clipboard
set clipboard=unnamedplus

"autocomplete
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'

"custom keys
"let mapleader=" "
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

if (has("termguicolors"))
	  set termguicolors
endif
set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1

set guifont=Monaco:h14
"toggle color change
call togglebg#map("<F5>")

" nerdtree setups
map <C-e> :NERDTreeToggle<cr>
imap <C-e> <esc>:NERDTreeToggle<cr>i
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0

"I don't like swap files
set noswapfile

"set search settings
set incsearch
set ignorecase
set hlsearch
:let @/ = ""

"turn on numbering
set relativenumber
set number

" fugitive git bindings
nnoremap <space>gs :Gstatus<CR>
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

"python with virtualenv support
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUA_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  sys.path.insert(0, project_base_dir)
"  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
"autocmd FileType python set omnifunc=pythoncomplete#C./configure --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.6/config make make installomplete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

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


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set foldlevel=99
"use space to open folds
"nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
