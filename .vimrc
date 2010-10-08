"==========================================================================
" Main / Behavior                                                       {{{
"==========================================================================

set nocompatible

" Pathogen initialization
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on

"-- Temp Files & Backups --------------------------------------------------
set directory=~/.vim/tmp
set nobackup

"-- Indenting -------------------------------------------------------------
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=8

"-- Searching -------------------------------------------------------------
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

"-- Folding ---------------------------------------------------------------
set foldenable
set foldmethod=manual

"-- Wildmenu --------------------------------------------------------------
set wildmenu
set wildmode=longest:full

"-- Scrolling -------------------------------------------------------------
set scrolloff=2
set sidescrolloff=10

"-- Wrapping --------------------------------------------------------------
"                 +---> Auto-wrap comments using textwidth
"                 |+--> Automatically insert the comment leader after <Enter>
"                 ||+-> Allow formatting of comments with 'gq'.
set formatoptions=crq
set textwidth=78
set nowrap
set linebreak

"-- Other / Unsorted ------------------------------------------------------
set autochdir
set backspace=indent,eol,start
set fileformats=unix,dos,mac
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

"-- Color Scheme ----------------------------------------------------------
" I love ir_black, but I've never gotten it to look very good in a terminal.
" 'filereadable' is primarily for portability.
if has("gui_running") && filereadable(expand("$HOME/.vim/bundle/ir_black/colors/ir_black.vim"))
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
noremap <Space> :

nnoremap <F3> :Rgrep<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" Emacs style movement on command line
cnoremap <C-b> <Left>
cnoremap <A-b> <S-Left>
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <A-f> <S-Right>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"-- Misc. Leader Mappings -------------------------------------------------
nnoremap <silent> ,ev :ed $MYVIMRC<CR>
nnoremap <silent> ,sv :so $MYVIMRC<CR>

nnoremap <silent> ,cd :lcd %:h<CR>
nnoremap <silent> ,md :!mkdir -p %:p:h<CR>

" Insert a line above/below current and return to normal mode. There has to be
" a better way to do this...
nnoremap <silent> ,o o<ESC>k
nnoremap <silent> ,O O<ESC>j

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
