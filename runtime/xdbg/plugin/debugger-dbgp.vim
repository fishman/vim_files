" DBGp client: a remote debugger interface to the DBGp protocol, see
" doc/debugger-DBGp.txt for more informations.
"
" Script Info and Documentation  {{{
"=============================================================================
"    Copyright: Copyright (C) 2007 Sam Ghods
"      License:	The MIT License
"				
"				Permission is hereby granted, free of charge, to any person obtaining
"				a copy of this software and associated documentation files
"				(the "Software"), to deal in the Software without restriction,
"				including without limitation the rights to use, copy, modify,
"				merge, publish, distribute, sublicense, and/or sell copies of the
"				Software, and to permit persons to whom the Software is furnished
"				to do so, subject to the following conditions:
"				
"				The above copyright notice and this permission notice shall be included
"				in all copies or substantial portions of the Software.
"				
"				THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"				OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"				MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"				IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"				CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"				TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"				SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"=============================================================================
" }}}

" Do not source this script when python is not compiled in or if the user has
" disabled it in his .vimrc via
" let g:loaded_debuggerdbgp = 1
if !has("python") || exists("g:loaded_debuggerdbgp")
    finish
endif
let g:loaded_debuggerdbgp = "0"

" Load debugger-dbgp.py from a runtime path
pyfile plugin/debugger-dbgp.py

map \<F1> :python debugger_resize()<cr>
map \<F2> :python debugger_command('step_into')<cr>
map \<F3> :python debugger_command('step_over')<cr>
map \<F4> :python debugger_command('step_out')<cr>

map <Leader>dr :python debugger_resize()<cr>
map <Leader>di :python debugger_command('step_into')<cr>
map <Leader>do :python debugger_command('step_over')<cr>
map <Leader>dt :python debugger_command('step_out')<cr>

nnoremap ,e :python debugger_watch_input("eval")<cr>A

map \<F5> :python debugger_run()<cr>
map \<F6> :python debugger_quit()<cr>

map \<F7> :python debugger_command('step_into')<cr>
map \<F8> :python debugger_command('step_over')<cr>
map \<F9> :python debugger_command('step_out')<cr>

" use F10 since f11 is expose for me
map \<F10> :python debugger_context()<cr>
map \<F12> :python debugger_property()<cr>
map \<F10> :python debugger_watch_input("context_get")<cr>A<cr>
map \<F12> :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>

hi DbgCurrent term=reverse ctermfg=White ctermbg=Red gui=reverse
hi DbgBreakPt term=reverse ctermfg=White ctermbg=Green gui=reverse

command! -nargs=? Bp python debugger_mark('<args>')
command! -nargs=0 Up python debugger_up()
command! -nargs=0 Dn python debugger_down()
sign define current text=->  texthl=DbgCurrent linehl=DbgCurrent
sign define breakpt text=B>  texthl=DbgBreakPt linehl=DbgBreakPt

if !exists('g:debuggerPort')
  let g:debuggerPort = 9000
endif 
if !exists('g:debuggerMaxChildren')
  let g:debuggerMaxChildren = 32
endif
if !exists('g:debuggerMaxData')
  let g:debuggerMaxData = 1024
endif
if !exists('g:debuggerMaxDepth')
  let g:debuggerMaxDepth = 1
endif
if !exists('g:debuggerMiniBufExpl')
  let g:debuggerMiniBufExpl = 0
endif
python debugger_init(1)
