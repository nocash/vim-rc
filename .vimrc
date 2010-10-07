"==========================================================================
" Behavior                                                              {{{
"==========================================================================

"-- Initialize ---------------------------------------------------------{{{
" I couldn't think of a better word than 'initialize' for all the important
" stuff that everyone tells you to put at the top of your .vimrc.
set nocompatible

" Run Pathogen
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on

"}}}
"-- Temp Files & Backups -----------------------------------------------{{{
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp"

"}}}
"-- Indenting ----------------------------------------------------------{{{
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=8

"}}}
"-- Searching ----------------------------------------------------------{{{
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

"}}}
"-- Folding ------------------------------------------------------------{{{
set foldenable
set foldmethod=manual

"}}}
"-- Wildmenu -----------------------------------------------------------{{{
set wildmenu
set wildmode=longest:full

"}}}
"-- Scrolling ----------------------------------------------------------{{{
set scrolloff=2
set sidescrolloff=10

"}}}
"-- Wrapping -----------------------------------------------------------{{{
"                 |---> Auto-wrap comments using textwidth
"                 ||--> Automatically insert the comment leader after <Enter>
"                 |||-> Allow formatting of comments with 'gq'.
set formatoptions=crq
set textwidth=78
set nowrap
set linebreak

"}}}
"-- Mousing (as if) ----------------------------------------------------{{{
set mousehide

"}}}
"-- Misc / Unsorted ----------------------------------------------------{{{
set backspace=indent,eol,start
set fileformats=unix,dos,mac
set hidden
set history=100
set laststatus=2
set matchtime=5
set noerrorbells
set nostartofline
set novisualbell
set report=0
set ruler
set showcmd
set showmatch

"}}}
"}}}
"==========================================================================
" Appearance                                                            {{{
"==========================================================================

"-- Color Scheme -------------------------------------------------------{{{
if has("gui_running") && filereadable(expand("$HOME/.vim/bundle/ir_black/colors/ir_black.vim"))
  colorscheme ir_black
else
  colorscheme default
endif

"}}}
"-- GUI Options --------------------------------------------------------{{{
if has("gui_running")
  set guifont=Monospace\ 13
" Clobber all GUI settings except for one...
"                |-> Use console-style drop-downs
  set guioptions=c
endif

"}}}
"-- Line Numbers -------------------------------------------------------{{{
set number
set numberwidth=4

"}}}
"}}}
"==========================================================================
" Plugin Options                                                        {{{
"==========================================================================

"-- SnipMate -----------------------------------------------------------{{{
" Set explicit snippets directory (to prevent examples from loading)
let g:snippets_dir="~/.vim/snippets"

"}}}
"}}}
"==========================================================================
" Key Mapping                                                           {{{
"==========================================================================

"-- Leader Key ---------------------------------------------------------{{{
" I don't actually use <leader> in my mappings, but I thought it'd be a
" good idea to explicitly declare it anyway.
nnoremap \ ,
vnoremap \ ,
let mapleader=","

"}}}
"-- Misc. Non-Leader Mappings ------------------------------------------{{{
noremap <Space> :

nnoremap <F3> :Rgrep<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>

"}}}
"-- Misc. Leader Mappings ----------------------------------------------{{{
nnoremap <silent> ,cd :lcd %:p:h<CR>
nnoremap <silent> ,o :normal o<CR>
nnoremap <silent> ,O :normal O<CR>

"}}}
"-- FuzzyFinder --------------------------------------------------------{{{
nnoremap <silent> ,fb :FufBuffer<CR>
nnoremap <silent> ,ff :FufFile<CR>
nnoremap <silent> ,fh :FufHelp<CR>
nnoremap <silent> ,fl :FufLine<CR>

"}}}
"-- Fugitive (Git) -----------------------------------------------------{{{
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gc :Gcommit<CR>
nnoremap <silent> ,gd :Gdiff<CR>
nnoremap <silent> ,gl :Glog<CR>
nnoremap <silent> ,gs :Gstatus<CR>

"}}}
"}}}
"==========================================================================
" Autocommands                                                          {{{
"==========================================================================

"-- Formatting ---------------------------------------------------------{{{
augroup formatting
  au!
  " Remove trailing whitespace on save
  autocmd FileType * autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
augroup END

"}}}
"-- Miscellaneous ------------------------------------------------------{{{
augroup miscellaneous
  au!
  " Cucumber (The ft detection in the plugin doesn't seem to work for me)
  autocmd BufNewFile,BufReadPost *.feature,*.story setfiletype cucumber
augroup END

"}}}
"}}}
"==========================================================================
" vim:sts=2:sw=2:tw=78:fdm=marker:
