set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'


filetype plugin indent on

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

syntax enable

" ---- solarized
set background=dark
colorscheme solarized

" ---- window size
set lines=30 columns=120

" ---- no backup file and swap file
set nobackup
set noswapfile

" normal settings
set helplang=cn 
set backspace=indent,eol,start 
" line number
set number 
set selection=inclusive

" set default gui font
set guifont=Monaco:h10:cANSI
"set gfw=Yahei_Mono:h10.5:cGB2312
"set gfw=Microsoft_YaHei:h10:cGB2312

" file encoding
set encoding=cp936
set fileencoding=utf-8
set fileencodings=utf-8,cp936,big5,latin1

" command line mode
set wildmenu

" welcome screen
set shortmess=atI

" tell VIM to always put a status line in, even
"    if there is only one window
set laststatus=2  

" use a status bar that is 2 rows high
set cmdheight=2                 

" status line information
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [Line:%l/%L]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" prevent special asia characters from false display
set ambiwidth=double

" line break support for asia languages
set fo+=mB

" highlight search result
set hlsearch 

" tab length
set ts=4 

" indent length
set sw=4 
set sm 
syntax on 

" incsearch
set is

" ruler
set ru

"Set to auto read when a file is changed from the outside
set autoread

"The commandbar is  high
set cmdheight=1

"show matching bracet
set showmatch

"Auto indent
set ai

"Smart indet
set si

" change color theme after entering edit mode
if version >= 700
  au InsertEnter * hi StatusLine guibg=#818D29 guifg=#FCFCFC gui=none
  au InsertLeave * hi StatusLine guibg=#EEEEEE guifg=#363636 gui=none
endif
 
" close tool box 
set guioptions=

"Wrap line
set wrap

"Sets how many lines of history VIM has to remember
set history=1000

" ------------------- NERDTree settings {{{
" auto start NERDTree at vim startup *too slow for large directories or blank
" start
"autocmd vimenter * NERDTree
"key bind F3
nnoremap <F3> :NERDTreeToggle <CR>
" auto close vim when NERDTree is the last window vim left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

let NERDChristmasTree=0

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=0

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$' ]

" -------------------- }}}

