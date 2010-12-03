"==========================================================================
" Main / Behavior                                                       {{{
"==========================================================================

set nocompatible

" Pathogen initialization
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on

"-- Files & Directories ---------------------------------------------------
" Tell vim to remember certain things when we exit
"           +-> Remember marks for up to # previously edited files
"           |   +-> Save up to # lines for each register
"           |   |     +-> Remember up to # lines of command-line history
"           |   |     |   +-> Saves and restores the buffer list
"           |   |     |   | +-> Where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.vim/.viminfo
set autochdir            " automatically change working directory
set directory=~/.vim/tmp " store swap files in a single directory
set nobackup             " do not make backups
set tags+=tags;          " search recursively upwards for tags file

"-- Indenting -------------------------------------------------------------
set expandtab            " use spaces instead of tabs
set shiftround           " round indent to multiple of 'shiftwidth'
set shiftwidth=2         " match shifting to indenting
set softtabstop=2        " indent two spaces by default
set autoindent
set smartindent

"-- Searching -------------------------------------------------------------
set hlsearch             " highlight search results
set ignorecase           " case-insensitive searching by default
set incsearch            " search as I type
set smartcase            " case-sensitive if I use a capital letter
set wrapscan             " wrap around the file when searching

"-- Folding ---------------------------------------------------------------
set foldenable           " enable folding...
set foldmethod=manual    " ...but don't do it automatically

"-- Wildmenu --------------------------------------------------------------
set wildmenu
set wildmode=longest:list

"-- Scrolling -------------------------------------------------------------
set scrolloff=2
set sidescrolloff=10

"-- Wrapping --------------------------------------------------------------
"                 +-> Auto-wrap comments using textwidth
"                 |+-> Automatically insert the comment leader after <Enter>
"                 ||+-> Allow formatting of comments with 'gq'.
set formatoptions=crq
set textwidth=78
set nowrap
set linebreak

"-- Other / Unsorted ------------------------------------------------------
set backspace=indent,eol,start
set fileformats=unix,dos
set hidden
set history=100
set laststatus=2
set matchtime=5
set mousehide
set noerrorbells
set nostartofline
set novisualbell
set report=0
set ruler
set shellslash
set shortmess+=I
set showcmd
set showmatch

"}}}
"==========================================================================
" Appearance                                                            {{{
"==========================================================================

set t_Co=256

"-- Color Scheme ----------------------------------------------------------
" 'filereadable' is primarily for portability.
if filereadable(expand("$HOME/.vim/bundle/zenburn/colors/zenburn.vim"))
  colorscheme zenburn
elseif filereadable(expand("$HOME/.vim/bundle/ir_black/colors/ir_black.vim"))
  colorscheme ir_black
else
  colorscheme default
endif

"-- GUI Options -----------------------------------------------------------
if has("gui_running")
" Clobber all GUI settings except for one...
"                +-> Use console-style drop-downs
  set guioptions=c
endif

"-- Line Numbers ----------------------------------------------------------
set number
set numberwidth=4

"-- Status Line -----------------------------------------------------------
"               +-> Relative file path
"               |   +-> Help buffer flag
"               |   | +-> Filetype
"               |   | | +-> Readonly flag
"               |   | | | +-> Modified flag
"               |   | | | | +-> Left/right alignment separator
set statusline=%f\ %h%y%r%m%=

" Warn if fileformat isn't Unix
set statusline+=%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*

" Warn if file encoding isn't UTF-8
set statusline+=%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*

" Warn if expandtab is wrong or there is mixed indenting
set statusline+=%#warningmsg#%{StatuslineTabWarning()}%*
set statusline+=%#warningmsg#%{StatuslineTrailingSpaceWarning()}%*

" Warn if paste is enabled
set statusline+=%#warningmsg#%{&paste?'[paste]':''}%*

"                  +-> Column number
"                  |  +-> Line number
"                  |  |   +-> Percentage through file
set statusline+=\ %c,%l\ %P

"}}}
"==========================================================================
" Plugin Options                                                        {{{
"==========================================================================

"-- Gist ------------------------------------------------------------------
let g:gist_detect_filetype=1

"-- NERDTree --------------------------------------------------------------
let NERDTreeShowBookmarks=1

"-- SnipMate --------------------------------------------------------------
" Set explicit snippets directory to prevent examples from loading.
let g:snippets_dir="~/.vim/snippets"

"}}}
"==========================================================================
" Key Mapping                                                           {{{
"==========================================================================

"-- Leader Key ------------------------------------------------------------
" I don't actually use <leader> in my mappings, but I thought it'd be a
" good idea to explicitly declare it anyway.
nnoremap \ ,
vnoremap \ ,
let mapleader=","

"-- Misc. Non-Leader Mappings ---------------------------------------------
map <Space> :

" Make Y behave consistently with D and C
map Y y$

" Re-select visual area after indenting
vmap > >gv
vmap < <gv

" Easier window/tab navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <m-l> gt
map <m-h> gT

" Redraw screen, or reload file with CTRL
noremap <silent> <F5> :redraw!<CR>
noremap <silent> <C-F5> :e!<CR>

" Shortcuts for plugins
nmap <F3> :Rgrep<CR>
nmap <silent> <F4> :NERDTreeToggle<CR>

" Emacs style movement on command line. <C-n> and <C-p> wipe out my command
" line cycling for things like the wildmenu, but it's well worth it
" (especially since I primarily use FuzzyFinder).
cmap <c-b> <Left>
cmap <m-b> <S-Left>
cmap <c-a> <Home>
cmap <c-f> <Right>
cmap <m-f> <S-Right>
cmap <c-e> <End>
cmap <c-p> <Up>
cmap <c-n> <Down>
cmap <m-bs> <C-W>

"-- Misc. Leader Mappings -------------------------------------------------
nmap <silent> ,v :ed $MYVIMRC<CR>
nmap <silent> ,V :so $MYVIMRC<CR>

nnoremap <silent> ,cd :lcd %:h<CR>
nnoremap <silent> ,md :!mkdir -p %:p:h<CR>

" Un-highlight last search
nnoremap <silent> ,hl :silent nohlsearch<CR>

"-- FuzzyFinder -----------------------------------------------------------
nnoremap <silent> ,fb :FufBuffer<CR>
nnoremap <silent> ,ff :FufFile<CR>
nnoremap <silent> ,fh :FufHelp<CR>
nnoremap <silent> ,ft :FufTag<CR>

"-- Fugitive (Git) --------------------------------------------------------
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gc :Gcommit<CR>
nnoremap <silent> ,gd :Gdiff<CR>
nnoremap <silent> ,gl :Glog<CR>
nnoremap <silent> ,gs :Gstatus<CR>

"}}}
"==========================================================================
" Autocommands                                                          {{{
"==========================================================================

augroup ResetStatuslineWarnings
  au!
  " Recalculate the trailing whitespace warning when idle and after saving
  autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
  " Recalculate the tab warning flag when idle and after writing
  autocmd CursorHold,BufWritePost * unlet! b:statusline_tab_warning
  " Recalculate the long line warning when idle and after saving
  autocmd CursorHold,BufWritePost * unlet! b:statusline_long_line_warning
augroup END

augroup Miscellaneous
  au!
  " Remove trailing whitespace on save. Using an autocommand to create an
  " autocommand like this is probably a bit redundant when I'm doing it to all
  " filetypes, but it'll allow me to limit it down the road if need be.
  autocmd FileType * autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  " Cucumber (The ft detection in the plugin doesn't seem to work for me)
  autocmd BufNewFile,BufReadPost *.feature,*.story setfiletype cucumber
  " Change PHP indenting (I just can't get used to two spaces with all of
  " those brackets).
  autocmd Filetype php setlocal sts=4 sw=4
  " Restore cursor to last known position when opening a previously edited
  " file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"}}}
"==========================================================================
" Functions                                                             {{{
"==========================================================================

function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[trail]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif

  return b:statusline_trailing_space_warning
endfunction

function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning = '[mixed-indenting]'
    elseif (spaces && !&et)
      let b:statusline_tab_warning = '[expandtab]'
    elseif (tabs && &et)
      let b:statusline_tab_warning = '[noexpandtab]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif

  return b:statusline_tab_warning
endfunction

"}}}
"==========================================================================
" Acknowledgements                                                      {{{
"==========================================================================
"
" Derek Wyatt for Vim and .vimrc tips
" - http://derekwyatt.org/vim/the-vimrc-file/my-vimrc-file
"
" Scrooloose for status line stuff
" - http://github.com/scrooloose/vimfiles/blob/3cc6832ef77515f76d8d/vimrc
"
" Column-comment style and various settings
" - http://vi-improved.org/vimrc.php
"
" Takeshi Nishida (FuzzyFinder) for section folding inspiration
" - http://www.vim.org/scripts/script.php?script_id=1984
"
"}}}
"==========================================================================
" Scared by folding? Use 'zR' to open everything up.
" vim:et:sts=2:sw=2:tw=78:fdm=marker:
