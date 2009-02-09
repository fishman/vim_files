" Author:	Gergely Kontra <kgergely@mcl.hu>
" Version:	0.13
" Description:	A simple text aligner
" Installation: Drop it into your plugin directory
"
" Warning:
"	Spaces and tabs in Lineup and LineupRE command should be escaped!
"	The syntax of the command may change in a future version!
"	Mappings are REMOVED!
" Usage:
"	First put something like
"	vmap <Space> :call <SID>LineupPrompt()<CR>
"	vmap <S-Space> :call <SID>LineupREPrompt()<CR>
"	to your .vimrc to protect yourself for typing too much :)

"	If you do so, and want to lineup eg. your declarations, just select
"	them visually, press space, then =
"	If you want more precise lineup, then press shift-space, and specify
"	your regexp
"
"    There are 4 commands defined, to make life easier
"    So you can write
"      :'<,'>Lineup =
"	 to align your definitions and
"      :'<,'>LineupRE \S\+\s\+\zs.
"	 to lineup the second words.
"      :'<,'>LineupREN 2 \W\w
"        to align the second word
"
"	NOTE: Zero-length regexps doesn't work so good.
"	If you are curious, why, just examine
"	:match('asdf asdf','\<')
"	and
"	:match('asdf asdf','\<',1)
"
" History:
"	0.1:	Initial release
"	0.11:	Bugfix (<SID> added)	Thx to Hans Deragon
"		(How can a buggy script rated so good!!! :)
"	0.12:	Bugfix (tabs...)	Thx to Gary Holloway
"	0.13:	Allow to lineup Nth thing
"
"TODO:	Simplify the script and test it
"
fu! s:Lineup(re,count,what) range
  " get the longest match
  let max = -1
  let i=a:firstline | while i<=a:lastline
    let idx=-1
    let j=0
    while j<a:count
      if a:re
	let idx=match(getline(i),a:what,idx+1)
      else
	let part=strpart(getline(i),idx+1)
	let di=stridx(part,a:what)
	if idx+di==-2
	  let idx=-1
	elseif idx==-1
	  let idx=idx+di+1
	else
	  let idx=idx+di
	end
      end
      let j=j+1
    endw
    if getline(i) =~ '\t'
      let j=0
      let tabs=0
      while j<=idx
	if strpart(getline(i),j,1) == "	"
	  let tabs=tabs+(&tabstop - ((j+tabs) % &tabstop))
	endif
	let j = j + 1
      endwhile
      let idx=idx+tabs
    endif
    if idx > max | let max = idx | endif
    let i = i + 1
  endw

  if max <= 0 | echo 'Nothing to align' | return | endif

  "align other lines
  let i=a:firstline
  while i<=a:lastline
    let idx=-1
    let curline=getline(i)
    let j=0
    while j<a:count
      if a:re
	let idx=match(curline,a:what,idx+1)
      else
	let part=strpart(curline,idx+1)
	let di=stridx(part,a:what)
	if idx+di==-2
	  let idx=-1
	elseif idx==-1
	  let idx=idx+di+1
	else
	  let idx=idx+di
	end
      end
      let j=j+1
    endw

    if idx != -1
      let res = strpart(curline,0,idx)
      let j = idx
      if res =~ '\t'
	let k=0
	let tabs=0
	while k<idx
	  if strpart(curline,k,1) == "	"
	    let tabs=tabs+(&tabstop - ((k+tabs) % &tabstop))
	  endif
	  let k = k + 1
	endwhile
	let j=j+tabs
      endif
      while j < max
	let j = j + 1
	let res = res .' '
      endw
      let res = res . strpart(curline,idx)
      call setline(i,res)
    endif
    let i = i + 1
  endw
endf

"Damned ranges, we must write functions...
fu! s:LineupPrompt() range
  echo 'Enter char to align!' | let c= nr2char(getchar())
  if c!="\<Esc>"
    exe a:firstline.','.a:lastline.'call <SID>Lineup(0,1,c)'
    "0.11 bugfix <SID> added
  en
endf

fu! s:LineupREPrompt() range
  let re=input('Enter RE to lineup!')
  exe a:firstline.','.a:lastline."call <SID>Lineup(1,1,re)"
  " another bugfix
endf

com! -range -nargs=* Lineup    <line1>,<line2>call <SID>Lineup(0,1,<f-args>)
com! -range -nargs=* LineupN   <line1>,<line2>call <SID>Lineup(0,<f-args>)
com! -range -nargs=* LineupRE  <line1>,<line2>call <SID>Lineup(1,1,<f-args>)
com! -range -nargs=* LineupREN <line1>,<line2>call <SID>Lineup(1,<f-args>)
