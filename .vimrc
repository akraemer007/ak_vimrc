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
Plugin 'morhetz/gruvbox'
Plugin 'shinchu/lightline-gruvbox.vim'
"Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'jnurmine/Zenburn'
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
" Keep cursor away from edges
set scrolloff=3
" Makes sure lines break on whole words
set linebreak

" show json quotes
set conceallevel=0

" colors
if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set t_Co=256
endif

" nord settings
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_diff_background = 1
colorscheme nord

" set background=dark    " Setting dark mode
" colorscheme gruvbox
" colorscheme zenburn

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
" if !has('gui_running')
" set t_Co=256
" endif
set noshowmode
set laststatus=2
      " \'colorscheme': 'nord',
let g:lightline = {
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
let g:lightline.colorscheme = 'nord'
" let g:lightline.colorscheme = 'gruvbox'


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
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>
" }}}

" Misc {{{
"copy to clipboard
set clipboard=unnamedplus
set mouse=v
"set search settings
set incsearch
set ignorecase
set hlsearch
:let @/ = ""

" }}}

"------------Start Python PEP 8 stuff----------------
set shiftwidth=4
set expandtab
set softtabstop=4

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
