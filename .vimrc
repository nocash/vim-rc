"==========================================================================
" Main / Behavior                                                       {{{
"==========================================================================

set nocompatible

syntax on
filetype plugin indent on

" Pathogen initialization
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Set platform variable for later conditionals
if has('unix')
  let s:uname = substitute(system('uname'), '\n', '', '')
endif

"-- Files & Directories ---------------------------------------------------
" Tell vim to remember certain things when we exit
"           +-> Remember marks for up to # previously edited files
"           |   +-> Remember global marks
"           |   |  +-> Save up to # lines for each register
"           |   |  |    +-> Remember up to # lines of command-line history
"           |   |  |    |     +-> Number of lines to save from the input line history
"           |   |  |    |     |    +-> Number of lines to save from the search history
"           |   |  |    |     |    |    +-> Disable 'hlsearch' highlighting when starting
"           |   |  |    |     |    |    | +-> Where to save the viminfo files
set viminfo='10,f1,<100,:1000,@100,/100,h,n~/.vim/.viminfo
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
set wildcharm=<c-z>
set wildignore+=*/error_pages/*,*/tmp/cache/*
set wildmenu
set wildmode=longest:list

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
set nojoinspaces
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

"}}}
"==========================================================================
" Plugin Options                                                        {{{
"==========================================================================

"-- CtrlP -----------------------------------------------------------------
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files = 5000
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0

"-- CSApprox --------------------------------------------------------------
" Hide warnings when terminal does not support enough colors to use CSApprox.
" let g:CSApprox_verbose_level=0

"-- FuzzyFinder -----------------------------------------------------------
let g:fuf_modesDisable=[]
let g:fuf_keyOpenSplit='<c-s>'
let g:fuf_keyOpenVsplit='<c-v>'
let g:fuf_keyOpenTabpage='<c-t>'
let g:fuf_keyNextMode='<c-e>'
let g:fuf_keyPrevPattern='<c-->'

"-- Gist ------------------------------------------------------------------
let g:gist_detect_filetype=1

"-- Gundo -----------------------------------------------------------------
if version < 703          " check for version lower than 7.3
  let g:gundo_disable=1   " disable Gundo plugin
endif

"-- NERDCommenter ---------------------------------------------------------
let g:NERDSpaceDelims=1

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
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['cucumber'] }

"-- UltiSnips -------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-space>" " aka <c-space>
let g:UltiSnipsJumpForwardTrigger="<c-space>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-space>" " won't work in terminal
" let g:UltiSnipsListSnippets="<s-nul>"
let g:UltiSnipsEditSplit='horizontal'

"}}}
"==========================================================================
" Appearance                                                            {{{
"==========================================================================

"-- GUI Options -----------------------------------------------------------
if has("gui_running")
" Keep the GUI, but disable most features.
"                +-> Use console-style drop-downs
"                |+-> Use Vim icon
  set guioptions=ci

" Set platform-specific fonts
  if s:uname == 'Darwin'
    set guifont=Menlo\ Regular:h15
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
set statusline+=%#warningmsg#%*

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
noremap <space> :
nnoremap <leader><tab> :tab sp<cr>

" Fix <c-space> in terminal vim (primarily for UltiSnips)
imap <nul> <c-space>
smap <nul> <c-space>

" Make Y behave consistently with D and C
nnoremap Y y$

" Re-select visual area after indenting
vnoremap > >gv
vnoremap < <gv

" Simpler movement in wrapped buffers
nnoremap <silent> j gj
nnoremap <silent> k gk

" Function Key Mappings
noremap <f3> :Rgrep<cr>
noremap <silent> <f12> :cclose<cr>

" Yank and paste from system clipboard
map <leader>y "+y
map <leader>Y "+Y
map <leader>p "+p
map <leader>P "+P
map <s-insert> "+gP
map! <s-insert> <c-r>+

" Easier window/tab navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Remap increment/decrement keys
nnoremap + <c-a>
nnoremap - <c-x>

" Emacs style insert/command movement
noremap! <c-b> <left>
noremap! <c-f> <right>
noremap! <m-b> <c-left>
noremap! <m-f> <c-right>
cnoremap <c-a> <home>
inoremap <c-a> <c-o>^
noremap! <c-e> <end>
inoremap <c-p> <up>
inoremap <c-n> <down>
inoremap <c-k> <c-o>D
noremap! <c-d> <del>
" switch clobbered <c-d> to <c-y>
inoremap <c-y> <c-d>

"-- Misc. Leader Mappings -------------------------------------------------
nnoremap <silent> <leader>v :ed $MYVIMRC<cr>
nnoremap <silent> <leader>V :so $MYVIMRC<cr>

nnoremap <silent> <leader>cd :lcd %:h<cr>
nnoremap <silent> <leader>md :!mkdir -p %:p:h<cr>

" Un-highlight last search
nnoremap <silent> <leader>hl :silent set hlsearch!<cr>

" Trim trailing whitespace
nnoremap <silent> <leader>w :%s/\s\+$//e<cr>

" Toggle list characters
nnoremap <silent> <leader>lc :set list!<cr>

"-- CtrlP -----------------------------------------------------------------
nnoremap <silent> <leader>t :CtrlP<cr>
nnoremap <silent> <leader>T :CtrlPClearCache<cr>:CtrlP<cr>
nnoremap <silent> <leader>b :CtrlPBuffer<cr>
nnoremap <silent> <leader>r :CtrlPMRU<cr>
nnoremap <silent> <leader>pbt :CtrlPBufTag<cr>
nnoremap <silent> <leader>pbT :CtrlPBufTagAll<cr>
nnoremap <silent> <leader>pc :CtrlPChange<cr>
nnoremap <silent> <leader>pC :CtrlPChangeAll<cr>
nnoremap <silent> <leader>pd :CtrlPDir<cr>
nnoremap <leader>pD :CtrlPDir
nnoremap <silent> <leader>pk :CtrlPBookmarkDir<cr>
nnoremap <silent> <leader>pK :CtrlPBookmarkDirAdd<cr>
nnoremap <silent> <leader>pl :CtrlPLine<cr>
nnoremap <silent> <leader>pm :CtrlPMixed<cr>
nnoremap <silent> <leader>pq :CtrlPQuickfix<cr>
nnoremap <silent> <leader>prts :CtrlPRTS<cr>
nnoremap <silent> <leader>pt :CtrlPTag<cr>
nnoremap <silent> <leader>pu :CtrlPUndo<cr>

"-- FuzzyFinder -----------------------------------------------------------
nnoremap <silent> <leader>fb :FufBuffer<cr>
nnoremap <silent> <leader>fc :FufMruCmd<cr>
nnoremap <silent> <leader>fd :FufDir<cr>
nnoremap <silent> <leader>ff :FufFile<cr>
nnoremap <silent> <leader>fh :FufHelp<cr>
nnoremap <silent> <leader>fl :FufLine<cr>
nnoremap <silent> <leader>fr :FufMruFile<cr>
nnoremap <silent> <leader>ft :FufTag<cr>

"-- Fugitive (Git) --------------------------------------------------------
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>ge :Gedit<cr>
nnoremap <silent> <leader>gl :Glog<cr>
nnoremap <silent> <leader>gr :Gread<cr>
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>

"-- Gundo -----------------------------------------------------------------
nnoremap <silent> <leader>u :GundoToggle<cr>

"-- NERDTree --------------------------------------------------------------
nnoremap <silent> <leader>n :execute 'NERDTreeToggle ' . getcwd()<cr>
nnoremap <silent> <leader>N :NERDTreeFind<cr>

"-- Solarized -------------------------------------------------------------
call togglebg#map("<F5>")

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
  autocmd BufNewFile,BufReadPost .autotest,*.watchr,Guardfile,Capfile,Cheffile setfiletype ruby
  " Automatically detect tmux config
  autocmd BufNewFile,BufReadPost .tmux.conf*,tmux.conf* setfiletype tmux
  " Restore cursor to last known position when opening a previously edited
  " file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " Load script that uses Tabularize to assist with aligning Cucumber tables
  " when editing Cucumber files.
  autocmd FileType cucumber
        \ if filereadable(expand('$HOME/.vim/scripts/tabularize-cuke-tables.vim'))
        \ | source $HOME/.vim/scripts/tabularize-cuke-tables.vim
        \ | endif
augroup END

"}}}
"==========================================================================
" Functions / Commands                                                  {{{
"==========================================================================

command! Marked
      \ silent execute '!open -a "Marked.app"' shellescape(expand('%'), 1) '&' | redraw!

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
