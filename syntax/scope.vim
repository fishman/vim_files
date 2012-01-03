" Vim syntax file
" Language:	Vim script
" Filenames:    *.vra
" Maintainer:	Thorsten Eggert
" Contributer:	Reza Jelveh
" Last Change:
" Version:	0

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match   scopeSection skipwhite contains=scopeRule "\[.\+\]"
syn match   scopeRule "^[^=:]\{-1,}="

syn match   scopeComment skipwhite "[;//].*"
syn match   scopePreProc skipwhite "^[#].*"
syn region  scopeString start=/"/ end=/"/

syn keyword scopeFunctions	$do $lt $eq $setvar $add $inc $tostring $tolong $min $max
syn keyword scopeFunctions	$substring $length
syn keyword scopeFunctions	$applGetInterface $applRemoveTimer $applListenTo $applSetTimer $applUnlisten $applSetState $applDeactivateResource
syn keyword scopeFunctions	$timediff $tdiff $datetime
syn keyword scopeFunctions	$voiceDetectDTMF $voicePlayStop $voiceDelDTMF $voicePlayWav
syn keyword scopeFunctions	$confGetPartyCount $confCreateParty $confDetectDTMF $confAdjustInput $confAdjustOutput $confRecordStop $confCreateMonitor $confRecord $confDetachMonitor
syn keyword scopeBoolean	TRUE FALSE
syn match scopeStringLiteral /\\"/ contained display
      \ containedin=scopeString

syn match scopeNumber display /\<[0-9]\d*\>/
"syn keyword scopeLanguageKeywords APPLIC_NAME APPLIC_DESCRIPTION RESINIT WORKSTATION CONNECT_TIMER DELAY_TIMER INIT_STATE TYPE DESCRIPTION
"syn keyword scopeLanguageKeywords RANGE DEFAULT TRUNK_IDLE STATE_NAME AE_CMD_START STATE_NAME RESOURCE ACTIVATE TIMESLOT WAITDIGITS
"syn keyword scopeLanguageKeywords RING_TIMER CLI SERVICE_INDICATOR TRUNK_TIMESLOT_TAG MODULE_NAME NETPORT LISTENTO LISTENMODE DEST

" Highlighting Settings
" ====================
"   Todo:      used for the todo comments (ones that have "TODO: something" in them)
"   Comment:   indicates a code comment
"   Statement: a code statement like a for loop
"   Type:      a user defined type generally
"   PreProc:   a pre-processor statement like #include <stdio.h> in C
"   Constant:  like a string or number in code
"   Function:
"   Identifier:
"   Delimiter:

hi def link scopeComment Comment
hi def link scopePreProc PreProc
hi def link scopeRule Identifier
hi def link scopeSection Keyword
hi def link scopeString  String
hi def link scopeFunctions Function
hi def link scopeBoolean   Constant
hi def link scopeNumber    Number
"hi def link scopeLanguageKeywords Statement


" AE Folding Emulation
" ====================

set foldmethod=syntax
set foldcolumn=4

syn cluster vimFold contains=aeFold
syn region aeFold
  \ start="^\s*;//\.\.\.s.*"
  \ end=";//\.\.\.e"
  \ transparent fold
  \ keepend extend
  \ containedin=ALLBUT,@vimNoFold

let b:current_syntax = "vra"

" setlocal foldtext=MyFoldText()
" function! MyFoldText()
"   let nucolwidth = &fdc + &number*&numberwidth
"   let winwd = winwidth(0) - nucolwidth - 5
"   let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
"   let prefix = " _______>>> "
"   let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
"   let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
"   let fillcharcount = winwd - len(line) - len(fdnfo)
"   return line . repeat(" ",fillcharcount) . fdnfo
" endfunction
