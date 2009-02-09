set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let b:surround_45 = "<% \r %>"
let b:surround_61 = "<%= \r %>"
let b:surround_35 = "<%# \r %>"
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #
let g:surround_65 = "<a href=\"\"> \r </a>"
" rails 
"au! BufEnter,BufNewFile,BufRead *.erb   imap  <buffer> <C-Z> <%=  %><C-O>3h

