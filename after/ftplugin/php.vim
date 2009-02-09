" highlight html and sql in php strings
let php_sql_query=1
let php_htmlInStrings=1
let php_folding=1

set makeprg=php\ -l\ % 


set errorformat=%m\ in\ %f\ on\ line\ %l


" set foldlevel=2

command! -buffer -bar -nargs=? -bang  Rproject :call s:Project(<bang>0,<q-args>)

let b:surround_45 = "<?php \r ?>"       " -
let b:surround_61 = "<?=\r?>"           " =
imap  <buffer> <C-Z> <??><C-O>h

map <C-F11> :!ctags -f .tmtags --excmd=pattern -R --tag-relative=yes 

set et
set sts=4
set sw=4
