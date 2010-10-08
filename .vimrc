"==========================================================================
" Main / Behavior                                                       {{{
"==========================================================================

set nocompatible

" Pathogen initialization
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on

"-- Temp Files & Backups --------------------------------------------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp"

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

" Warn if &paste is enabled
set statusline+=%#warningmsg#%{&paste?'[paste]':''}%*

"                  +-> Column number
"                  |  +-> Line number
"                  |  |   +-> Percentage through file
set statusline+=\ %c,%l\ %P

"}}}
"==========================================================================
" Plugin Options                                                        {{{
"==========================================================================

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

"-- Misc. Leader Mappings -------------------------------------------------
nnoremap <silent> ,cd :lcd %:p:h<CR>
nnoremap <silent> ,o :normal o<CR>
nnoremap <silent> ,O :normal O<CR>

"-- FuzzyFinder -----------------------------------------------------------
nnoremap <silent> ,fb :FufBuffer<CR>
nnoremap <silent> ,ff :FufFile<CR>
nnoremap <silent> ,fh :FufHelp<CR>
nnoremap <silent> ,fl :FufLine<CR>

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
  " Remove trailing whitespace on save
  autocmd FileType * autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  " Cucumber (The ft detection in the plugin doesn't seem to work for me)
  autocmd BufNewFile,BufReadPost *.feature,*.story setfiletype cucumber
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
" vim:sts=2:sw=2:tw=78:fdm=marker:
