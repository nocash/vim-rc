"==========================================================================
" Behavior                                                             {{{1
"==========================================================================

set nocompatible

" Run Pathogen
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on

"-- Temp Files & Backups ----------------------------------------------{{{2
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp"

"2}}}
"-- Indenting ---------------------------------------------------------{{{2
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=8

"2}}}
"-- Searching ---------------------------------------------------------{{{2
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

"2}}}
"-- Folding -----------------------------------------------------------{{{2
set foldenable
set foldmethod=manual

"2}}}
"-- Wildmenu ----------------------------------------------------------{{{2
set wildmenu
set wildmode=longest:full

"2}}}
"-- Scrolling ---------------------------------------------------------{{{2
set scrolloff=2
set sidescrolloff=10

"2}}}
"-- Wrapping ----------------------------------------------------------{{{2
"                 |---> Auto-wrap comments using textwidth
"                 ||--> Automatically insert the comment leader after <Enter>
"                 |||-> Allow formatting of comments with 'gq'.
set formatoptions=crq
set textwidth=78
set nowrap
set linebreak

"2}}}
"-- Mousing (as if) ---------------------------------------------------{{{2
set mousehide

"2}}}
"-- Misc / Unsorted ---------------------------------------------------{{{2
set backspace=indent,eol,start
set fileformats=unix,dos,mac
set hidden
set history=100
set laststatus=2
set matchtime=5
set noerrorbells
set nostartofline
set novisualbell
set number
set numberwidth=4
set report=0
set ruler
set showcmd
set showmatch

"2}}}
"1}}}
"==========================================================================
" Appearance                                                           {{{1
"==========================================================================

"-- Color Scheme ------------------------------------------------------{{{2
if filereadable(expand("$HOME/.vim/bundle/ir_black/colors/ir_black.vim"))
  colorscheme ir_black
endif

"2}}}
"-- GUI Options -------------------------------------------------------{{{2
if has("gui_running")
  set guifont=Monospace\ 13
" Clobber all GUI settings except for one...
"                |-> Use console-style drop-downs
  set guioptions=c
endif

"2}}}
"1}}}
"==========================================================================
" Plugin Options                                                       {{{1
"==========================================================================

"-- SnipMate ----------------------------------------------------------{{{2
" Set explicit snippets directory (to prevent examples from loading)
let g:snippets_dir="~/.vim/snippets"

"2}}}
"1}}}
"==========================================================================
" Key Mapping                                                          {{{1
"==========================================================================

"-- Leader Key --------------------------------------------------------{{{2
" I don't actually use <leader> in my mappings, but I thought it'd be a
" good idea to explicitly declare it anyway.
nnoremap \ ,
vnoremap \ ,
let mapleader=","

"2}}}
"-- Misc. Non-Leader Mappings -----------------------------------------{{{2
nnoremap <F3> :Rgrep<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>

"2}}}
"-- Misc. Leader Mappings ---------------------------------------------{{{2
nnoremap <silent> ,cd :cd %:p:h<CR>
nnoremap <silent> ,o :normal o<CR>
nnoremap <silent> ,O :normal O<CR>

"2}}}
"-- FuzzyFinder -------------------------------------------------------{{{2
nnoremap <silent> ,fb :FufBuffer<CR>
nnoremap <silent> ,ff :FufFile<CR>
nnoremap <silent> ,fh :FufHelp<CR>
nnoremap <silent> ,fl :FufLine<CR>

"2}}}
"-- Fugitive (Git) ----------------------------------------------------{{{2
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gc :Gcommit<CR>
nnoremap <silent> ,gl :Glog<CR>
nnoremap <silent> ,gd :Gdiff<CR>

"2}}}
"1}}}
"==========================================================================
" Autocommands                                                         {{{1
"==========================================================================

augroup formatting
  au!
  " Remove trailing whitespace on save
  autocmd FileType * autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
augroup END

augroup miscellaneous
  au!
  " Cucumber (The ft detection in the plugin doesn't seem to work for me)
  autocmd BufNewFile,BufReadPost *.feature,*.story setfiletype cucumber
augroup END

"1}}}
"==========================================================================
" vim:sts=2:sw=2:tw=78:fdm=marker:
