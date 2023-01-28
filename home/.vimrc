
" Max's vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load plugin bundles, all hail Tim Pope
exec pathogen#infect()

set tw=80

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set wildmode=longest,list,full
set wildmenu
set completeopt=longest,menuone

set ai
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4

filetype plugin indent on

" Open NERDTree with C-w-t
map <c-w><c-t> :NERDTreeToggle<CR>

" solarized colorscheme
set bg=dark
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
colorscheme elflord
syntax on
set exrc
set secure
