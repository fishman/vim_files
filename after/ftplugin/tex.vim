setl foldmethod=marker
" latex settings
" silent
" map <buffer> <silent> <Leader>ls :
"       \ !/Applications/Skim.app/Contents/SharedSupport/displayline
"       \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
"       \ "%:p" <CR><CR>
map <buffer> <silent> <Leader>ls :
      \ !zathura --synctex-forward=<C-R>=line('.')<CR>:1:"%:p"
      \ "<C-R>=LatexBox_GetOutputFile()<CR>" <CR> <CR>



