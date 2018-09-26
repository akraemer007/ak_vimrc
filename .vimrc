set nocompatible
filetype off

" vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             "plugin manager
"git interface
Plugin 'tpope/vim-fugitive'               "git tools for vim
Plugin 'airblade/vim-gitgutter'           "shows changes since last add
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"markdown
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"info bars
Plugin 'fholgado/minibufexpl.vim'         "see buffers
Plugin 'itchyny/lightline.vim'            "ligtline bottom bar
Plugin 'itchyny/vim-gitbranch'            "lightline git
"misc settings
Plugin 'romainl/vim-cool'                 "unhighight after search
Plugin 'scrooloose/syntastic'             "sytax checking
Plugin 'Yggdroot/indentLine'              "nice indents
Plugin 'tpope/vim-surround'               "surround with quotes or paren w/ ys
Plugin 'tpope/vim-commentary'             "comment easily w/ gc
Plugin 'tpope/vim-unimpaired'             "adds bracket movement
Plugin 'tpope/vim-repeat'                 "repeats plugin actions
"writing
Plugin 'junegunn/goyo.vim'                "activate writing mode
Plugin 'junegunn/limelight.vim'           "typewriter mode like ulysses
"tmux
Plugin 'christoomey/vim-tmux-navigator'   "navigate tmux panes w/vim bindings
Plugin 'epeli/slimux'                     "repl
"Colors!!!
Plugin 'arcticicestudio/nord-vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'drewtempelmeyer/palenight.vim'
"Plugin 'jnurmine/Zenburn'
"Plugin 'liuchengxu/space-vim-dark'
"unused
"python sytax checker
"Plugin 'nvie/vim-flake8'
"Plugin 'vim-scripts/Pydiction'
" Plugin 'vim-scripts/indentpython.vim' 
"Plugin 'kien/ctrlp.vim'
"Plugin 'sjl/gundo.vim'
"html
" isnowfy only compatible with python not python3
"Plugin 'isnowfy/python-vim-instant-markdown'
call vundle#end()
" }}}

" quick interactions {{{
" set leader
let mapleader = "\<Space>"

" easy splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move through paragraphs easier
map j gj
map k gk

" paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" use jj for easy esc
imap jj <Esc>
" }}}

" UI Config {{{
" show a visual line under the cursor's current line
" set cursorline
" Makes sure lines break on whole words
set linebreak
" Keep cursor away from edges
set scrolloff=3
"set foldcolumn=1 "supposed to keep cursor away from sides. Doesn't work.

" colors
if (has("termguicolors"))
    set termguicolors
endif

" nord settings
let g:nord_italic = 1
let g:nord_italic_comments = 1
"let g:nord_uniform_diff_background = 1
colorscheme nord

set guifont=Monaco:h14
"toggle color change
call togglebg#map("<F9>")

"turn on numbering
set number
set relativenumber
" Turn off relative numbring
nnoremap <Leader>n :set relativenumber! number!<ENTER>

" allow hidden buffers w/out saving
set hidden

" delete current buffer
nmap <silent> <leader>d :bp\|bd #<CR>
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

" writing mode
let g:goyo_width = 65
autocmd! User GoyoEnter Limelight0.7
autocmd! User GoyoLeave Limelight!
nnoremap <Leader>w :Goyo <ENTER>

" light line settings
if !has('gui_running')
	  set t_Co=256
endif
set noshowmode
set laststatus=2
let g:lightline = {
      \'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype'
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
" fugitive git bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>dp :diffput<CR>
nnoremap <Leader>do :diffget<CR>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>gp :Git push<Space>
nnoremap <Leader>gl :Git pull<Space>

"slimux -- use ctrl-c to repl
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR> 
vnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
nnoremap <C-c><C-v> :SlimuxREPLConfigure<CR>
" }}}

" Misc {{{
"copy to clipboard
set clipboard=unnamedplus

"set search settings
set incsearch
set ignorecase
set hlsearch
:let @/ = ""
":set list lcs=tab:\|\                     "nice space showing
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
au BufRead,BufNewFile *.py,*.pyw, set textwidth=120

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

let g:python3_host_prog = '/usr/anaconda2/envs/py36/bin/python3'
"----------Stop python PEP 8 stuff--------------

" Terminal emulation settings
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>t :vsplit +terminal<CR> :set norelativenumber nonumber<CR>
"|:startinsert<CR>
