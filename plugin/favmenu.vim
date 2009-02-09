" Author: Gergely Kontra <kgergely@mcl.hu>
" Version: 0.32
"
" Last Modified: 6 13/05/2006 22:05:03 Leal@RAINT:favmenu.vim
"
" Description:
"    Adds a new menu to vim
"    You can add your favourite files (and directories) into it
"
" FEEDBACK PLEASE
"
" Installation:
" -------------
" Just drop it into your plugin directory
"
" Configuration:
" -------------
" By changing the following variables you can configure the behavior of this
" plugin. Set the following variables in your .vimrc/_vimrc files using the
" 'let' command.
"
" The list of favorite file names is stored in the file specified by the
" FAV_File variable. The default setting for this variable is
" $HOME/.vim_fav_files. You can let it point to a specified file by adding the
" following line to the .vimrc file:
"
"       let FAV_File = 'd:\some_place\_vim_fav_files'
"
" History:
" -------------
"    0.1: Initial release
"    0.2:
"	  * Fixed bug, which caused same files to hide each other
"         * Your favourite files must be located at FAV_File
"	  * You can Edit the favorites. Menus will updated, when you save
"         * When you click on the menu, it invokes the fav_fun function
"         * You can choose cascade delete menu by defining fav_cascade_del
"	    (at startup!)
"         * You can add directories to your favorites
"           Thanks to the_intellectual_person <arun_kumar_ks@hotmail.com>,
"           who gave me a patch for this
"    0.21:* Fixed bug, which caused not to update you menu, when you remove
"	    one of your favorites
"	  * Fixed REGEXP bug (When removing files)
"    0.22:* Nice fallbacks, if FAV_File is not defined.
"         * fav_fun is renamed to OPEN_FUNC, so you can store it in your
"           viminfo file, and can be reused in my MRU script. Sorry for the
"           inconvinience.
"    0.23:* You can limit the width of the path appearing in the menu, by
"           defining (and setting) the PATHSIZELIMIT variable.
"         * Added menu: Refresh (will be removed in a later release)
"    0.24:* Close the file, even when 'hidden' is set
"            Thanks to Roger Pilkey for the bug report
"    0.3: * Use clientserver feature to synchronize the menu instances
"    0.31:* Shut up clientserver stuff
"    0.32:* Hungarian translation
"
" TODO:
"    Are all valid filenames escaped? (Feedback please!)
if exists('loaded_favmenu')
  finish
endif
let loaded_favmenu=1

let s:cascade_del=exists('fav_cascade_del')

if !exists('FAV_File')
  if has('unix')
    let FAV_File = $HOME. "/.vim_fav_files"
  el
    let FAV_File = $VIM . "/_vim_fav_files"
  en
en

if !exists('SpWhenModified') "integration with FavMenu
  fu! SpWhenModified(f)
    if &mod
      exe 'sp '.a:f
    el
      exe 'e '.a:f
    en
  endf
  fu! SpWhenNamedOrModified(f)
    if bufname('')!='' || &mod
      exe 'sp '.a:f
    el
      exe 'e '.a:f
    en
  endf
  fu! OpenFile()
    if exists('g:OPEN_FUNC')
      retu g:OPEN_FUNC
    el
      retu 'SpWhenModified'
    en
  endf
  fu! TruncPath(path)
    let p=a:path
    let pathlen=strlen(p)
    if exists('g:PATHSIZELIMIT') && pathlen>g:PATHSIZELIMIT
      let cut=match(p,'[/\\]',pathlen-g:PATHSIZELIMIT)
      if cut>0 && cut<pathlen
	let p='\.\.\.'.strpart(p,cut)
      en
    en
    retu p
  endf
en

fu! s:AddThisFile(name)
  let fullname=fnamemodify(a:name,':p')
  let path=TruncPath(escape(fnamemodify(fullname,':p:h'),'\. #%'))

  let fn=escape(fnamemodify(fullname,':p:t'),'\. #%')
  if strlen(fn)
    let item='[&'.s:cnt.']\ \ '.fn.'<Tab>'.path
  el
    let item='[&'.s:cnt.']\ \ <DIR><Tab>'.path
  en
  let s:cnt=s:cnt+1
  exe 'amenu Fa&vorites.'.item." :cal \<C-r>=OpenFile()<CR>('".escape(fullname,'#%')."')<CR>"
  if s:cascade_del
    exe 'amenu Fa&vorites.&Remove.'.item." :cal <SID>RemoveThisFile('".fullname."')<CR>"
  en
endf

fu! s:AddThisFilePermanent(name)
  let fullname=fnamemodify(a:name,':p')
  cal s:AddThisFile(a:name)
  let v=virtcol('.')|exe 'vs '.g:FAV_File|se nobl bh=delete|0
  if search('^\V'.escape(fullname,'\').'\$','w')
    cal confirm('This is already in your favorites file!',' :-/ ',1,'W')
  el
    exe 'norm Go'.fullname."\<Esc>"
  en
  " No patching
  let pm=&pm|let &pm=''|wq|let &pm=pm|exe 'norm' v.'|'
  sil! cal s:RefreshAll()
endf

fu! s:RemoveThisFile(name)
  let fullname=fnamemodify(a:name,':p')
  exe 'vs '.g:FAV_File|set nobl noro ma|0
  if search('^\V'.escape(fullname,'\').'\$','w')
    d _
  el
    cal confirm('Cannot find this file in your favorites file!',' :-/ ',1,'e')
  en
  let pm=&pm|let &pm=''|let hid=&hid|se nohid|wq|let &pm=pm|let &hid=hid
  cal FavmenuInit()
  sil! cal s:RefreshAll()
endf

fu! s:RefreshAll()
  if has('clientserver')
    let servers=serverlist()
    let pos=0
    let re="[^\n]\\+"  "Thanx to Mark Hillebrand
    wh match(servers,re,pos) != -1
      let s=matchstr(servers,re,pos)
      let pos=pos+strlen(s)+1
      if v:servername!=s
	cal remote_expr(s,'FavmenuInit()')
      en
    endw
  en
endf

fu! FavmenuInit()
  let s:cnt=1
  sil! aun Fa&vorites
  amenu Fa&vorites.&Add\ current\ file :cal <SID>AddThisFilePermanent(@%)<CR>
  amenu Fa&vorites.&Edit\ favorites :cal <C-r>=OpenFile()<CR>(g:FAV_File)<CR>:au BufWritePost <C-r>% cal FavmenuInit()<CR>
  amenu Fa&vorites.Re&fresh :cal FavmenuInit()<CR>
  if s:cascade_del
    amenu Fa&vorites.&Remove.Dummy <Nop>
  el
    amenu Fa&vorites.&Remove\ current\ file :cal <SID>RemoveThisFile(@%)<CR>
  en
  amenu Fa&vorites.-sep-	<nul>

  if filereadable(g:FAV_File)
    exe 'sv '.g:FAV_File|se bh=delete
    let s=@/
    g/\S/cal s:AddThisFile(getline('.'))
    let @/=s
    q
    sil! aun Fa&vorites.&Remove.Dummy
  en
endf

" using =~ 'zh_CN' to match zh_CN on Win and zh_CN.[charset] on Linux
if $LANG=~'zh_CN'
  menutrans Fa&vorites			书签(&B)
  menutrans &Add\ current\ file		收藏当前文件(&A)
  menutrans &Remove\ current\ file	移除当前文件(&R)
  menutrans &Edit\ favorites		编辑书签(&E)
  menutrans Re&fresh			刷新(&R)
en

if $LANG=='hu'
  menutrans Fa&vorites			Ked&vencek
  menutrans &Add\ current\ file		&Aktu醠is\ f醞l\ hozz醓d醩a
  menutrans &Remove			&Elt醰ol韙醩
  menutrans &Remove\ current\ file	&Aktu醠is\ f醞l\ elt醰ol韙醩a
  menutrans &Edit\ favorites		K&edvencek\ rendez閟e
  menutrans Re&fresh			A&ktualiz醠醩
en

sil! cal FavmenuInit()

