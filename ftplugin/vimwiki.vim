augroup vimwiki
  " au! BufRead ~/vimwiki/index.<wbr>wiki  !hg pull;hg update
  " au! BufWritePost ~/vimwiki/*  !hg add <afile>;hg commit -m " ";hg push
  au! BufWritePost ~/vimwiki/*  !git add <afile>;git commit -m " "
augroup END<wbr>
