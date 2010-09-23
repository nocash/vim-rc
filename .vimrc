set nocompatible
set background=dark
syntax on

"" Run Pathogen
call pathogen#runtime_append_all_bundles()

filetype plugin indent on
set autochdir
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup
set clipboard+=unnamed
set directory=~/.vim/tmp
set fileformats=unix,dos,mac
set noerrorbells
set wildmenu
set wildmode=longest:full

set incsearch
set laststatus=2
set linespace=0
set matchtime=5
set hlsearch
set nostartofline
set novisualbell
set number
set numberwidth=4
set report=0
set ruler
set scrolloff=2
set showcmd
set showmatch
set sidescrolloff=10

set expandtab
set formatoptions=rq
set ignorecase
set nowrap
set shiftround
set smartcase
set shiftwidth=4
set softtabstop=4
set tabstop=8

set foldenable
set foldmethod=manual

colorscheme ir_black

if has("gui_running")
    set guifont=Monospace\ 13
    set guioptions=ce
    set guioptions-=T
    set mousehide
endif

"" Keymaps
nmap <F3> :Rgrep<CR>

"" Autocommands
if ! exists('autocommands_loaded')
    let autocommands_loaded = 1

    "" Remove trailing whitespace on save for certain files.
    autocmd FileType css,html,js,php,ruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

    "" Change indenting for Ruby files
    autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2

endif
