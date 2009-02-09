" \file outlinetoggle.vim
" \brief Vim-Tip #333: Syntax-based folding for c/c++/java
" \author Kartik Agaram as of Vim:   6.0
" \author Mangled by Feral
" \author Further mauled by rajas_sambhare
" \date Tue, 24 Sep 2002 05:44 Pacific Daylight Time
" \version $Id$
" Version: 0.04
" History:
" [Feral:267/02@05:43] v0.03:
" saves the old marker method now.
" stoped trying to be clever (just do the command twice heh)
" v0.02
" trys to be clever and start in the proper outline mode based on if it
" finds a "{>>" in the file.
" [Rajas:07/16/04] v0.04.1:
" Combined feral's tip with the foldcolumn method and cleaned out comments
" from ferals code. Changed commands name to FOLD (shorter :)

" Tip #333: Syntax-based folding for c/c++/java
" tip karma Rating 0/0, Viewed by 88
"
"created: September 23, 2002 18:32 complexity:   intermediate
"author: Kartik Agaram as of Vim:   6.0
"
"Here's a function to toggle the use of syntax-based folding for a c/c++/java file. It also handles folding markers.

function! <SID>OutlineToggle()
  let OldLine = line(".")
  let OldCol = virtcol(".")
  if (! exists ("b:outline_mode"))
    let b:outline_mode = 0
    let b:OldMarker = &foldmarker
  endif
  if (b:outline_mode == 0)
    let b:outline_mode = 1
    set foldmethod=marker
    set foldmarker={,}
    silent! exec "%s/{{{/{<</"
    silent! exec "%s/}}}/}>>/"
    set foldcolumn=4
  else
    let b:outline_mode = 0
    set foldmethod=marker
    let &foldmarker=b:OldMarker
    silent! exec "%s/{<</{{{/"
    silent! exec "%s/}>>/{{{/"
    set foldcolumn=0
  endif
  execute "normal! ".OldLine."G"
  execute "normal! ".OldCol."|"
  unlet OldLine
  unlet OldCol
  execute "normal! zv"
endfunction

:command! -nargs=0 FOLD call <SID>OutlineToggle()

