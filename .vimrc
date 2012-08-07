"==========================================================================
" Main / Behavior                                                       {{{
"==========================================================================

set nocompatible

" Set platform variable for later conditionals
if has('unix')
  let s:uname = substitute(system('uname'), '\n', '', '')
endif

" Pathogen initialization
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on

"-- Files & Directories ---------------------------------------------------
" Tell vim to remember certain things when we exit
"           +-> Remember marks for up to # previously edited files
"           |   +-> Remember global marks
"           |   |  +-> Save up to # lines for each register
"           |   |  |    +-> Remember up to # lines of command-line history
"           |   |  |    |   +-> Number of lines to save from the input line history
"           |   |  |    |   |   +-> Number of lines to save from the search history
"           |   |  |    |   |   |   +-> Disable 'hlsearch' highlighting when starting
"           |   |  |    |   |   |   | +-> Where to save the viminfo files
set viminfo='10,f1,<100,:20,@20,/20,h,n~/.vim/.viminfo
set nobackup               " do not make backups
set directory=~/.vim/tmp// " store swap files in a single directory

if version >= 703          " check for version 7.3 or higher
  set undodir=~/.vim/tmp   " list of directory names for undo files
  set undofile             " automatically saves undo history to a file
endif

"-- Indenting -------------------------------------------------------------
set expandtab         " use spaces instead of tabs
set shiftround        " round indent to multiple of 'shiftwidth'
set shiftwidth=2      " match shifting to indenting
set softtabstop=2     " indent two spaces by default
set tabstop=2
set autoindent
set smartindent
" set copyindent
" set preserveindent

"-- Searching -------------------------------------------------------------
set nohlsearch        " highlight search results
set ignorecase        " case-insensitive searching by default
set incsearch         " search as I type
set smartcase         " case-sensitive if I use a capital letter
set wrapscan          " wrap around the file when searching

" -- Folding ---------------------------------------------------------------
set foldenable        " enable folding
set foldmethod=manual " use syntax to determine folds

"-- Wildmenu --------------------------------------------------------------
set wildmenu
set wildmode=longest:list
set wildcharm=<C-Z>

"-- Scrolling -------------------------------------------------------------
set scrolloff=2
set sidescrolloff=10

"-- Wrapping --------------------------------------------------------------
"                 +-> Auto-wrap comments using textwidth
"                 |+-> Allow formatting of comments with 'gq'.
set formatoptions=cq
set textwidth=78
set nowrap
set linebreak

"-- Tags ------------------------------------------------------------------
set tags=./tags;     " search recursively upwards for tags file
set showfulltag
set cscopetag
set cscopetagorder=0

"-- Non-Printing Characters -----------------------------------------------
set nolist
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:«

"-- Other / Unsorted ------------------------------------------------------
set autoread
set backspace=indent,eol,start
set fileformats=unix,dos,mac
set hidden
set history=100
set laststatus=2
set matchtime=5
set mouse=nv " allow mouse in normal and visual mode
set mousehide
set noerrorbells
set nostartofline
set novisualbell
set printoptions=paper:letter
set report=0
set ruler
set shellslash
set shortmess+=I
set showcmd
set showmatch
set title
set ttyfast
set virtualedit=block
set nojoinspaces

"}}}
"==========================================================================
" Plugin Options                                                        {{{
"==========================================================================

"-- Autojump --------------------------------------------------------------
" This plugin sounds great, but it's causing a lot of issues for me right now.
" Leaving it installed, though, in the hopes that it gets fixed or I find the
" time to do it myself.
let g:loaded_autojump=1

"-- CSApprox --------------------------------------------------------------
" Hide warnings when terminal does not support enough colors to use CSApprox.
let g:CSApprox_verbose_level=0

"-- FuzzyFinder -----------------------------------------------------------
let g:fuf_modesDisable=[]
let g:fuf_keyOpenSplit='<C-s>'
let g:fuf_keyOpenVsplit='<C-v>'
let g:fuf_keyOpenTabpage='<C-t>'
let g:fuf_keyNextMode='<C-e>'
let g:fuf_keyPrevPattern='<C-->'

"-- Gist ------------------------------------------------------------------
let g:gist_detect_filetype=1

"-- Gundo -----------------------------------------------------------------
if version < 703          " check for version lower than 7.3
  let g:gundo_disable=1   " disable Gundo plugin
endif

"-- NERDTree --------------------------------------------------------------
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'

"-- Solarized -------------------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_italic=0

"-- Syntastic -------------------------------------------------------------
let g:syntastic_enable_signs=0
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

"-- UltiSnips -------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<nul>" " aka <c-space>
" let g:UltiSnipsListSnippets=""
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"}}}
"==========================================================================
" Appearance                                                            {{{
"==========================================================================

"-- GUI Options -----------------------------------------------------------
if has("gui_running")
" Clobber all GUI settings except for one...
"                +-> Use console-style drop-downs
"                |+-> Use Vim icon
  set guioptions=ci

" Set platform-specific fonts
  if s:uname == 'Darwin'
    set guifont=Menlo\ Regular:h14
  endif
endif

"-- Color Scheme ----------------------------------------------------------
if !exists("g:colors_name")
  set background=dark

  if has("gui_running")
    colorscheme solarized
  elseif &t_Co >= 88
    " Might be better to check if CSApprox is available. Or both.
    colorscheme ir_black
  else
    colorscheme default
  endif
endif

"-- Line Numbers ----------------------------------------------------------
set number
set numberwidth=3

"-- Status Line -----------------------------------------------------------
"               +-> Relative file path
"               |   +-> Help buffer flag
"               |   | +-> Filetype
"               |   | | +-> Readonly flag
"               |   | | | +-> Modified flag
"               |   | | | | +-> Left/right alignment separator
set statusline=%f\ %h%y%r%m%=

" Warn on syntax errors
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*

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
" Key Mapping                                                           {{{
"==========================================================================

"-- Leader Key ------------------------------------------------------------
nnoremap : ,
vnoremap : ,
let mapleader=","

"-- Misc. Non-Leader Mappings ---------------------------------------------
noremap <Space> :

" Make Y behave consistently with D and C
nnoremap Y y$

" Re-select visual area after indenting
vnoremap > >gv
vnoremap < <gv

" Simpler movement in wrapped buffers
nnoremap j gj
nnoremap k gk

" Function Key Mappings
noremap <F3> :Rgrep<CR>
noremap <silent> <F12> :cclose<CR>

" Yank and paste from system clipboard
map <leader>y "+y
map <leader>Y "+Y
map <leader>p "+p
map <leader>P "+P

" Easier window/tab navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <c-tab> gt
noremap <c-s-tab> gT

" Remap increment/decrement keys
nnoremap + <C-a>
nnoremap - <C-x>

" Emacs style insert/command movement. <C-n> and <C-p> wipe out my command
" line cycling for things like the wildmenu, but it's well worth it
" (especially since I primarily use FuzzyFinder).
noremap! <c-b> <Left>
noremap! <c-f> <Right>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
noremap! <m-b> <C-Left>
noremap! <m-f> <C-Right>
noremap! <c-a> <Home>
noremap! <c-e> <End>

"-- Misc. Leader Mappings -------------------------------------------------
nnoremap <silent> <leader>v :ed $MYVIMRC<CR>
nnoremap <silent> <leader>V :so $MYVIMRC<CR>

nnoremap <silent> <leader>cd :lcd %:h<CR>
nnoremap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Un-highlight last search
nnoremap <silent> <leader>hl :silent set hlsearch!<CR>

" Trim trailing whitespace
nnoremap <silent> <leader>w :%s/\s\+$//e<CR>

" Toggle list characters
nnoremap <silent> <leader>lc :set list!<CR>

"-- Command-T -------------------------------------------------------------
nnoremap <silent> <leader>t :CommandT<CR>
nnoremap <silent> <leader>T :CommandTFlush<CR>:CommandT<CR>
nnoremap <silent> <leader>b :CommandTBuffer<CR>

"-- FuzzyFinder -----------------------------------------------------------
nnoremap <silent> <leader>fb :FufBuffer<CR>
nnoremap <silent> <leader>fc :FufMruCmd<CR>
nnoremap <silent> <leader>fd :FufDir<CR>
nnoremap <silent> <leader>ff :FufFile<CR>
nnoremap <silent> <leader>fh :FufHelp<CR>
nnoremap <silent> <leader>fl :FufLine<CR>
nnoremap <silent> <leader>fr :FufMruFile<CR>
nnoremap <silent> <leader>ft :FufTag<CR>

"-- Fugitive (Git) --------------------------------------------------------
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>

"-- Gundo -----------------------------------------------------------------
nnoremap <silent> <leader>u :GundoToggle<CR>

"-- NERDTree --------------------------------------------------------------
nnoremap <silent> <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <leader>N :NERDTreeFind<CR>

"-- Tag List --------------------------------------------------------------
" noremap <silent> <leader>t :TlistToggle<CR>

"-- UltiSnips -------------------------------------------------------------
" See the section under "Plugin Options"

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
  " Cucumber (The ft detection in the plugin doesn't seem to work for me)
  autocmd BufNewFile,BufReadPost *.feature,*.story setfiletype cucumber
  " Set Ruby for certain non .rb files
  autocmd BufNewFile,BufReadPost .autotest setfiletype ruby
  " Automatically detect tmux config
  autocmd BufNewFile,BufReadPost .tmux.conf*,tmux.conf* setfiletype tmux
  " Restore cursor to last known position when opening a previously edited
  " file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"}}}
"==========================================================================
" Functions / Commands                                                  {{{
"==========================================================================

" Use :W to sudo write a file.
if executable('sudo') && executable('tee')
  command! W
        \ execute "w !sudo tee >/dev/null %" |
        \ e!
endif

command! SolarizedInvert let &background = &background == 'dark' ? 'light' : 'dark'

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
" Miscellaneous leechery:
" - https://github.com/gmarik/vimfiles/blob/f956c7d4c684a04f0e876209a1b31b8774871470/vimrc
"
"}}}
"==========================================================================
" Scared by folding? Use 'zR' to open everything up.
" vim:et:sts=2:sw=2:tw=78:fdm=marker:fdls=0
