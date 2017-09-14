"==========================================================================
" Plugins & Configuration
"==========================================================================

set nocompatible
let mapleader=" "
" let maplocalleader=","

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" required!
Plugin 'gmarik/vundle'

"-- Ag -----------------------------------------------------------------
Plugin 'rking/ag.vim'

let g:ag_highlight=1

nnoremap <leader>A :Ag!<space>
nnoremap <leader>a :Ag!<cr>

" 
"-- Auto Pairs ---------------------------------------------------------
Plugin 'jiangmiao/auto-pairs'

"-- AutoSave -----------------------------------------------------------
" Plugin '907th/vim-auto-save'

let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0

"-- CSS3 Syntax --------------------------------------------------------
Plugin 'hail2u/vim-css3-syntax'

"-- CtrlP --------------------------------------------------------------
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'ctrlpvim/ctrlp.vim'

let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/](bundle|error_pages|tmp[\/]cache)',
  \ }
let g:ctrlp_follow_symlinks=1
let g:ctrlp_match_current_file=1
let g:ctrlp_match_func={'match' : 'matcher#cmatch' }
let g:ctrlp_max_depth=5
let g:ctrlp_max_files=1500
let g:ctrlp_show_hidden=1
let g:ctrlp_switch_buffer='e'
let g:ctrlp_use_caching=0
let g:ctrlp_user_command={
  \ 'types': {
  \   1: ['.git', 'git ls-files --cached --others --exclude-standard --full-name -- %s']
  \   }
  \ }


"-- Dash ---------------------------------------------------------------
Plugin 'rizzatti/dash.vim'

nmap K <Plug>DashGlobalSearch
nnoremap <silent> <leader>dd <Plug>DashGlobalSearch


"-- Fugitive (Git) -----------------------------------------------------
Plugin 'tpope/vim-fugitive'

nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>ge :Gedit<cr>
nnoremap <silent> <leader>gl :Glog<cr>
nnoremap <silent> <leader>gr :Gread<cr>
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>


"-- Gist ---------------------------------------------------------------
Plugin 'mattn/gist-vim'

let g:gist_detect_filetype=1


"-- GitGutter-----------------------------------------------------------
Plugin 'airblade/vim-gitgutter'


"-- Gundo --------------------------------------------------------------
Plugin 'sjl/gundo.vim'

if version < 703          " check for version lower than 7.3
  let g:gundo_disable=1   " disable Gundo plugin
endif

nnoremap <silent> <leader>u :GundoToggle<cr>


"-- JavsScript ---------------------------------------------------------
Plugin 'pangloss/vim-javascript'


"-- JSX ----------------------------------------------------------------
Plugin 'mxw/vim-jsx'

" By default, JSX syntax highlighting and indenting will be enabled only for
" files with the .jsx extension.
let g:jsx_ext_required = 0


"-- MatchIndent --------------------------------------------------------
" Disabled because it occasionally messes up the indentation of a file and I
" can't yet be bothered to figure out how to override it.
" Plugin 'conormcd/matchindent.vim'


"-- NERDTree -----------------------------------------------------------
Plugin 'scrooloose/nerdtree'

"-- Paredit ------------------------------------------------------------
Plugin 'vim-scripts/paredit.vim'

"-- Rhubarb ------------------------------------------------------------
Plugin 'tpope/vim-rhubarb'

"-- Splitjoin ----------------------------------------------------------
Plugin 'AndrewRadev/splitjoin.vim'

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''


"-- Syntastic ----------------------------------------------------------
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=0
let g:syntastic_mode_map={
    \ 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['cucumber'] }
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'


"-- TComment -----------------------------------------------------------
Plugin 'tomtom/tcomment_vim'

let g:tcommentMaps=1


"-- UltiSnips ----------------------------------------------------------
" Plugin 'SirVer/ultisnips'

" let g:UltiSnipsExpandTrigger="<c-space>" " aka <c-space>
" let g:UltiSnipsListSnippets="<s-nul>"
let g:UltiSnipsEditSplit='horizontal'
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"


"-- Vimux --------------------------------------------------------------
Plugin 'benmills/vimux'

let g:VimuxHeight = "40"
let g:VimuxOrientation = "h"

nnoremap <leader>t!! :call VimuxRunCommand("!!")<cr>
nnoremap <leader>tC :call VimuxSendKeys("C-c")<cr>
nnoremap <leader>td :call VimuxSendKeys("C-d")<cr>
nnoremap <leader>tgs :call VimuxRunCommand("gs")<cr>
nnoremap <leader>tpl :call VimuxRunCommand(getline('.'))<cr>
nnoremap <leader>tpx :call VimuxRunCommand("!!!")<cr>
nnoremap <leader>tr :call VimuxRunCommand("stty sane")<cr>
nnoremap <leader>tt :VimuxPromptCommand<cr>


"-- Vinegar ------------------------------------------------------------
Plugin 'tpope/vim-vinegar'


"-- Vroom --------------------------------------------------------------
Plugin 'skalnik/vim-vroom'

let g:vroom_clear_screen=0
let g:vroom_map_keys=0
let g:vroom_use_dispatch=0
let g:vroom_use_vimux=1
let g:vroom_use_zeus=1

nnoremap <silent> <leader>r :VroomRunNearestTest<cr>
nnoremap <silent> <leader>R :VroomRunTestFile<cr>


"-- Other Plugins ------------------------------------------------------

" Plugin 'aaronjensen/vim-autocomplpop'
" Plugin 'aaronjensen/vim-recentcomplete'
" Plugin 'dirkwallenstein/vim-localcomplete'
" Plugin 'tpope/vim-dispatch'
" Plugin 'tpope/vim-pathogen'
" Plugin 'vim-scripts/L9'
"" Plugin 'pelodelfuego/vim-swoop'
"" Plugin 'tpope/vim-projectionist'
"" Plugin 'wellle/targets.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'int3/vim-extradite'
Plugin 'jnurmine/Zenburn'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/webapi-vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'nocash/bufkill.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/CSApprox'
Plugin 'vim-scripts/JavaScript-syntax'
Plugin 'vim-scripts/nginx.vim'
Plugin 'wgibbs/vim-irblack'

" 
"==========================================================================
" Vim Settings                                                          
"==========================================================================

syntax on
filetype plugin indent on

" Set platform variable for later conditionals
if has('unix')
  let s:uname = substitute(system('uname'), '\n', '', '')
endif

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"-- Files & Directories ---------------------------------------------------
" Tell vim to remember certain things when we exit
"           +-> Remember marks for up to # previously edited files
"           |   +-> Remember global marks
"           |   |  +-> Save up to # lines for each register
"           |   |  |    +-> Remember up to # lines of command-line history
"           |   |  |    |     +-> Number of lines to save from the input line history
"           |   |  |    |     |    +-> Number of lines to save from the search history
"           |   |  |    |     |    |    +-> Disable 'hlsearch' highlighting when starting
"           |   |  |    |     |    |    |
set viminfo='10,f1,<100,:1000,@100,/100,h
set nobackup               " do not make backups
set noswapfile             " do not make swapfiles

if version >= 703                     " check for version 7.3 or higher
  set undodir=$TMPDIR,/tmp,~/.vim/tmp " list of directory names for undo files
  set undofile                        " automatically saves undo history to a file
endif

"-- Indenting -------------------------------------------------------------
set expandtab         " use spaces instead of tabs
set shiftround        " round indent to multiple of 'shiftwidth'
set shiftwidth=2      " match shifting to indenting
set softtabstop=2     " indent two spaces by default
set tabstop=2
set autoindent
set smartindent

"-- Lines & Columns -------------------------------------------------------
set colorcolumn=80
set number
set numberwidth=3
set scrolloff=2
set sidescrolloff=10

"-- Searching -------------------------------------------------------------
set nohlsearch        " highlight search results
set ignorecase        " case-insensitive searching by default
set incsearch         " search as I type
set smartcase         " case-sensitive if I use a capital letter
set wrapscan          " wrap around the file when searching

"-- Folding ---------------------------------------------------------------
set foldenable        " enable folding
set foldmethod=manual

"-- Wildmenu --------------------------------------------------------------
set wildcharm=<c-z>
set wildmenu
set wildmode=longest:list

"-- Windows ---------------------------------------------------------------
" https://github.com/aaronjensen/vimfiles/blob/8e79bc/vimrc#L539-L547
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

"-- Splits ----------------------------------------------------------------
set splitbelow
" set splitright

"-- Wrapping --------------------------------------------------------------
set linebreak
set nowrap
set textwidth=78

"-- Tags ------------------------------------------------------------------
set tags=./tags;     " search up tree for tags file
set showfulltag
set cscopetag
set cscopetagorder=0

"-- Non-Printing Characters -----------------------------------------------
set list
set listchars=tab:·\ ,trail:·,extends:»,precedes:«

"-- Other / Unsorted ------------------------------------------------------
set autoread
set autowrite
set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
set fileformats=unix,dos,mac
set hidden
set history=100
set laststatus=2
set matchtime=5
set mouse=a
set mousehide
set noerrorbells
set nojoinspaces
set nostartofline
set novisualbell
set printoptions=paper:letter
set report=0
set ruler
set shell=/bin/bash
set shellslash
set shortmess+=I
set showcmd
set showmatch
set title
set ttimeoutlen=5
set ttyfast
set virtualedit=block


"==========================================================================
" Appearance                                                            
"==========================================================================

"-- GUI Options -----------------------------------------------------------
if has("gui_running") && !exists("g:vimrc_gui_options_set")
  let g:vimrc_gui_options_set=1
" Keep the GUI, but disable most features.
"                +-> Use console-style drop-downs
"                |+-> Use Vim icon
  set guioptions=ci

" Set platform-specific fonts
  if s:uname == 'Darwin'
    " set macligatures
    " set guifont=Fira\ Code:h14
    set guifont=Inconsolata-g:h14,\ Menlo\ Regular:h15
  endif
endif

"-- Color Scheme ----------------------------------------------------------
if !exists("g:colors_name")
  set background=dark

  if has("gui_running")
    colorscheme molokai
  elseif &t_Co >= 88
    if &diff
      colorscheme ir_black
    else
      colorscheme molokai
    endif
  else
    colorscheme default
  endif
endif

" disable Background Color Erase (BCE) so that color schemes render properly
" when inside 256-color tmux and GNU screen. see also
" http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

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


"==========================================================================
" Key Mapping                                                           
"==========================================================================

"-- Misc. Non-Leader Mappings ---------------------------------------------

" Make Y behave consistently with D and C
nnoremap Y y$

" Simpler movement in wrapped buffers
nnoremap j gj
nnoremap k gk

" Function Key Mappings
nnoremap <silent> <f5> :checktime<cr>
noremap <silent> <f12> :cclose<cr>

" Easier window/tab navigation
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Remap increment/decrement keys
" nnoremap + <c-a>
" nnoremap - <c-x>

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

" Miscelaneous
cnoremap %% %:h/

"-- Spacemacs Analogs -----------------------------------------------------
" :'<,'>sort i /<leader>/

nnoremap <silent> <leader>\ :NERDTreeToggle<cr>

" [b]uffer
nnoremap <silent> <leader>bb :CtrlPBuffer<cr>
nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <leader>bt :CtrlPBufTag<cr>
nnoremap <silent> <leader>bT :CtrlPBufTagAll<cr>

" [d]
nnoremap <silent> <leader>dd :Dash<cr>

" [f]ile
nnoremap <silent> <leader>ff :CtrlP<cr>
nnoremap <silent> <leader>fd :NCVEditCwd<cr>
nnoremap <silent> <leader>fr :CtrlPMRU<cr>
nnoremap <silent> <leader>fs :w<cr>
nnoremap <silent> <leader>fS :wa<cr>
nnoremap <silent> <leader>fu :CtrlPUndo<cr>
" Copy file location to clipboard
nnoremap          <leader>fy :redir @*> \| echon @% \| redir END<cr>

" [fe] file edit
nnoremap <silent> <leader>fed :tabe $MYVIMRC<cr>
nnoremap <silent> <leader>feR :so $MYVIMRC<cr>

" [g]it
nnoremap          <leader>gb :Gblame<cr>
nnoremap          <leader>gcd :Gcd<cr>

" [j]ump
nnoremap <silent> <leader>jc :CtrlPChange<cr>
nnoremap <silent> <leader>jC :CtrlPChangeAll<cr>
nnoremap <silent> <leader>jl :CtrlPLine %<cr>
nnoremap <silent> <leader>jL :CtrlPLine<cr>
nnoremap <silent> <leader>jt :CtrlPTag<cr>

" [p]roject
nnoremap          <leader>pD :CtrlPDir
nnoremap <silent> <leader>pd :CtrlPDir<cr>
nnoremap <silent> <leader>pf :CtrlP<cr>
nnoremap <silent> <leader>pk :CtrlPBookmarkDir<cr>
nnoremap <silent> <leader>pK :CtrlPBookmarkDirAdd<cr>
nnoremap <silent> <leader>pm :CtrlPMixed<cr>
nnoremap <silent> <leader>pq :CtrlPQuickfix<cr>
nnoremap <silent> <leader>pw :CtrlP %:h<cr>

" [t]oggle
nnoremap <silent> <leader>th :silent set hlsearch!<cr>
nnoremap <silent> <leader>tl :set list!<cr>

" [q]uit
nnoremap <silent> <leader>qq :qa<cr>

" [w]indow
nnoremap <silent> <leader>wd :quit<cr>

" [x] transform
" [xa] align
noremap <silent> <leader>xa\ :Tab /\\<cr>
noremap <silent> <leader>xjj :SplitjoinJoin<cr>
noremap <silent> <leader>xjk :SplitjoinSplit<cr>
noremap <silent> <leader>xs :sort i<cr>
map     <silent> <leader>xv vii<leader>xs
map     <silent> <leader>xx <leader>xs

" [/]
nnoremap          <leader>/ :Ag! 

"-- Misc. Leader Mappings -------------------------------------------------
" nnoremap <silent> <leader>v :tabe $MYVIMRC<cr>
" nnoremap <silent> <leader>V :so $MYVIMRC<cr>

nnoremap <silent> <leader>cd :lcd %:h<cr>
nnoremap <silent> <leader>md :silent execute '!mkdir -p %:p:h' \| redraw!<cr>

map <s-insert> gP
map! <s-insert> <c-r>"

" Open buffer in new tab
nnoremap <leader>gt :tab sp<cr>

" Visual select changed text
nnoremap <silent> <leader>cv `[v`]

" Promote variable to RSpec let
nnoremap <silent> <leader><leader>let :PromoteToLet<cr>

" Toggle window resizing
nnoremap <silent> <leader><leader>win :ToggleWindowResizing<cr>

" Open a temporary file with autosave
nnoremap <leader><leader>temp :NCVTempFile<cr>

"--------------------------------------------------------------------------
" Make Vim recognize XTerm escape sequences for Page and Arrow
" keys combined with modifiers such as Shift, Control, and Alt.
" See http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term =~ '^screen'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"

  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif


"==========================================================================
" Autocommands                                                          
"==========================================================================

augroup ResetStatuslineWarnings
  au!
  " Recalculate the trailing whitespace warning when idle and after saving
  au CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
  " Recalculate the tab warning flag when idle and after writing
  au CursorHold,BufWritePost * unlet! b:statusline_tab_warning
  " Recalculate the long line warning when idle and after saving
  au CursorHold,BufWritePost * unlet! b:statusline_long_line_warning
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup FileTypeDetection
  au!
  " Set Ruby for certain non .rb files
  au BufNewFile,BufReadPost .autotest,Guardfile,Capfile,Cheffile setfiletype ruby
  " Set HAML filetype
  au BufNewFile,BufReadPost *.hamlc setfiletype haml
  " Automatically detect tmux config
  au BufNewFile,BufReadPost .tmux.conf*,tmux.conf* setfiletype tmux
augroup END

augroup Miscellaneous
  au!
  " Restore cursor to last known position when opening previously edited file.
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " Automatically remove fugitive buffers
  au BufReadPost fugitive://* set bufhidden=delete
  " Start in insert mode for commit
  au BufEnter *.git/COMMIT_EDITMSG exe BufEnterCommit()
  " Do not create undo files for certain files
  au BufWritePre *.git/COMMIT_EDITMSG setlocal noundofile
  " Align case|default within swtich statement
  " au FileType javascript set cinoptions+=:0
  " Improve syntax highlighting in CSS files.
  autocmd FileType css,sass,scss setlocal iskeyword+=-
  " Remove trailing whitespace
  au FileType coffee,eruby,haml,javascript,php,ruby,sass,scss,sh,xml
    \ au BufWritePre <buffer>
      \ let pos = getpos('.')
      \ | execute '%s/\s\+$//e'
      \ | call setpos('.', pos)
"                                 +-> Auto-wrap comments using textwidth
"                                 |+-> Allow formatting of comments with 'gq'
"                                 ||+-> Remove comment leader when joining lines
"                                 |||+-> Do not auto-wrap existing long lines
"                                 ||||     +-> Do no reinsert comment leader on <enter> in insert mode
"                                 ||||     |+-> Do not reinsert comment leader when pressing 'o'
  au BufNewFile,BufReadPost *
        \ setlocal formatoptions+=cqjl fo-=ro
augroup END


"==========================================================================
" Functions / Commands                                                  
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

function! NCVCamelCaseToUnderscore()
  substitute#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g
endfunction
command! NCVCamelCaseToUnderscore :call NCVCamelCaseToUnderscore()

function! NCVGithubUrlToVundle()
  substitute/\v.*github\.com\/(.*)\.git?/Plugin '\1'/
endfunction
command! NCVGithubUrlToVundle :call NCVGithubUrlToVundle()

function! NCVOpenSpec()
  let spec_file = substitute(expand("%:r"), '^app/' , 'spec/', '') . '_spec.' . expand("%:e")
  execute "edit " . spec_file
endfunction
command! NCVOpenSpec :call NCVOpenSpec()

" don't seem to have $ITERM_PROFILE, but do this anyway?
if exists('$ITERM_PROFILE') || 1
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

function! ToggleWindowResizing()
  if &winwidth == '84'
    set winwidth&
    set winheight=5
    set winminheight&
    set winheight&
  else
    set winwidth=84
    set winheight=5
    set winminheight=5
    set winheight=999
  endif
endfunction
command! ToggleWindowResizing :call ToggleWindowResizing()

function! PromoteToLet()
  substitute/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  silent exe "normal =="
endfunction
command! PromoteToLet :call PromoteToLet()

function! NCVTempFile()
  let syncdir = "$HOME/Dropbox/tmp"
  let syncfile = syncdir.'/'.substitute(tempname(), '/', '_', 'g')
  execute 'edit '.syncfile
  au CursorHold,WinLeave,VimLeave <buffer> update
  " setlocal formatoptions+=ta
endfunction
command! NCVTempFile :call NCVTempFile()

" Start in insert mode for commit
function! BufEnterCommit()
  normal gg0
  if getline('.') == ''
    startinsert
  end
endfunction

function! StripTrailingRestoreCursor()
  let pos = getpos('.')
  execute '%s/\s\+$//e'
  call setpos('.', pos)
endfunction

function! NCVEditCwd()
  let editdir = expand('%:h')
  if editdir == ''
    let editdir = getcwd()
  endif
  execute 'edit '.editdir
endfunction
command! NCVEditCwd :call NCVEditCwd()

" Macro for making Markdown === header:
" mq:.,+g/^[=-]\+$/d\\`qyyp:s/./=/g\`q

"==========================================================================
" Acknowledgements                                                      
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
" - https://github.com/aaronjensen/vimfiles
" - https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"

"==========================================================================
" Scared by folding? Use 'zi' to temporarily disable it.
" vim:et:sts=2:sw=2:tw=78:fdm=marker:fdls=0
