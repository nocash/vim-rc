" The contents of this file are mostly from a Gist by Tim Pope
" (https://gist.github.com/287147) with minor adjustments.

inoremap <buffer> <silent> <bar> <bar><esc>:call <sid>TabularizeCucumberTables()<cr>a

function! s:TabularizeCucumberTables()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
