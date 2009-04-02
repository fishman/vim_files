""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   \\|//    _    _  ___  ______
"    o o      \  /   /   /  /  /
"     U        \/ __/_ _/ _/ _/_
" by Leal - http://www.leal.cn/
"

" Description: vimrc with dozens of scripts, for linux/windows
" Derive From: Leal <linxiao.li AT gmail DOT com> 
"              Amix - http://www.amix.dk/vim/vimrc.html
"              MetaCosm - http://vi-improved.org/vimrc.php
"              Sidney - http://www.afn.org/~afn39695/sidney.htm
" Last Change: 
" Maintainer:  Reza Jelveh
" SVN Repo:    
" Version:     
"
" Section:
" ------------------------------------------------------------------
"   *> General
"   *> Colors and fonts
"   *> Visual cues
"   *> Visual search
"   *> Moving around and tabs
"   *> Parenthesis/bracket expanding
"   *> General abbrevs
"   *> Editing mappings etc.
"   *> Cmdline settings
"   *> Buffer related
"   *> Search related
"   *> Files and backups
"   *> Text options
"   *> Spell checking
"   *> Plugin settings
"   ------ *> grep.vim
"   ------ *> a.vim
"   ------ *> crefvim.vim
"   ------ *> largefile.vim
"   ------ *> taglist.vim
"   ------ *> project.vim
"   ------ *> projtags.vim
"   ------ *> vcscommand.vim
"   ------ *> NERD_commenter.vim
"   ------ *> NERD_tree.vim
"   ------ *> winmanager.vim
"   ------ *> autocomplpop.vim
"   ------ *> supertab.vim
"   ------ *> marks_corey.vim
"   ------ *> bufexplorer.vim
"   ------ *> lineup.vim
"   ------ *> fuzzyfinder.vim
"   ------ *> xml.vim
"   ------ *> yankring.vim
"   ------ *> C/C++ stuff
"   ------ *> Others
"   *> Cope
"   *> OmniCompletion
"   *> Misc
"
" Usage:
"   1. Create necessary folders and files.
"      $VIMDATA      x:\vim\vimdata on windows, ~/.vim/vimdata on linux
"       |-- temp        dir to put swap files when :set swapfile
"       |-- backup      dir to put backup files when :set backup
"       |-- diary       dir to store calendar.vim's diaries
"       |-- GetLatest   dir to store getscript.vim's downloads
"       |     `-- GetLatestVimScripts.dat
"       |-- _vim_fav_files       file to store favmenu.vim's items
"       `-- _vim_mru_files       file to store mru.vim's items
"
"   2. Get your favorite scripts on www.vim.org thru getscript.vim.
"
"   3. Get necessary utilities, especially on windows, such as:
"      wget  - http://users.ugent.be/~bpuype/wget/
"      ctags - http://ctags.sf.net/
"
"   4. If you find anything that you couldn't understand, do this:
"      :h keyword OR :helpgrep keyword OR press K (<S-k>) over it.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " use vim as vim, put at the very start
map Q gq
                        " do not use Ex-mode, use Q for formatting
set history=400         " lines of Ex commands, search history ...
set browsedir=buffer    " use the directory of the related buffer
" set clipboard+=unnamed  " use register '*' for all y, d, c, p ops
set isk+=$,%,#          " none of these should be word dividers
set autoread            " auto read when a file is changed outside
set confirm             " raise a confirm dialog for changed buffer
set fenc=utf-8          " character encoding for file of the buffer
set fencs=ucs-bom,utf-8,gb18030,gbk,gb2312,cp936
set timeoutlen=200      " Time to wait after ESC (default causes an annoying delay)
filetype plugin on      " enable filetype plugin
filetype indent on

if $TERM != "linux" && $TERM != "screen" && $TERM != "rxvt-unicode"
  set mouse=a           " except screen & SecureCRT's linux terminal
endif

let mapleader = ","     " set mapleader, then <leader> will be ,
let g:mapleader = ","
                        " fast saving
"nmap <leader>w :w!<cr>
nmap <F1> :w!<cr>
imap <F1> <C-O>:w!<cr>
"nmap <leader>f :find<cr>

if has("win32")         " platform dependent
  let $VIMDATA  = $VIM.'/vimdata'
  let $VIMFILES = $VIM.'/vimfiles'
else
  let $VIMDATA  = $HOME.'/.vim/vimdata'
  let $VIMFILES = $HOME.'/.vim'
endif
                        " fast sourcing and editing of the .vimrc
"map <leader>s :source $MYVIMRC<cr>
map <leader>e :e! $MYVIMRC<cr>
au! BufWritePost [\._]vimrc source $MYVIMRC

set pastetoggle=<F6>    " when pasting something in, don't indent
set rtp+=$VIMDATA       " add this to rtp to satisfy getscript.vim
set path=.,/usr/include/*, " where gf, ^Wf, :find will search
set tags=./tags,tags,.tmtags    " used by CTRL-] together with ctags
set makeef=error.err    " the errorfile for :make and :grep
set ffs=unix,dos,mac    " behaves good under both linux/windows
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors And Fonts: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable           " enable syntax hl

if has("win32")
  try | set gfn=Consolas:h11:cANSI | catch | endtry " Vista only
elseif has("gui_gtk2")
  set gfn="Consolas 12"
else
  set gfn=Consolas:h13,Inconsolata:h14,PanicSans:h12
endif

" matchparentesis is pretty slow on big files :(
let loaded_matchparen = 1
if has("gui_running")
  " prepare path
  "set shell=$VIMDATA/path.sh
  " the `b' puts a scrollbar at the bottom, which has no effect if wrap is set
  " e sets the gui tabline
  " r sets the right scrollbar
  set guioptions-=T
  set guioptions=agme
  set tabpagemax=30
  set mousehide

  set columns=170
  if has("gui_gtk2")
    set lines=56
    set showcmd
  elseif has("gui_macvim") || has("gui_mac")
    set columns=190
    set lines=59
  else
    set lines=50
    set cursorline
  endif

  let psc_style='cool'

  "colo ps_color
  " colo desert
  colo wombat

else
  set title
  "set background=light
  "colo ir_black
  if $TERM == "rxvt-unicode"
    set t_Co=256
    "colo desert256
    colo wombatc
    " colo desertc
    " colo leo    
    " colo gardener
    " colo inkpot

  elseif $TERM == "xterm-color"
    colo desert
  else
    "colo desert
    colo wombat
  endif
endif

set runtimepath+=~/.vim/runtime/theonevimlib/core
set runtimepath+=~/.vim/runtime/theonevimlib/contrib
call theonevimlibsetup#Setup()

set runtimepath+=~/.vim/runtime/vim-ruby
set runtimepath+=~/.vim/runtime/vim-rails
set runtimepath+=~/.vim/runtime/nerdcommenter
" set runtimepath+=~/.vim/runtime/nerdsnippets
set runtimepath+=~/.vim/runtime/vimoutliner
set runtimepath+=~/.vim/runtime/snipMate

if has("win32")
  set rtp+=~/.vim/runtime/win
  runtime plugin/visual_studio.vim
endif

runtime plugin/snipMate.vim
runtime after/plugin/snipMate.vim
" runtime plugin/NERD_snippets.vim
runtime plugin/NERD_commenter.vim
" matchit fun
runtime macros/matchit.vim
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7         " minimal screen lines above/below cursor
set wildmenu            " :h and press <Tab> to see what happens
set wig=*.o,*.pyc       " type of file that will not in wildmenu
set ruler               " show current position along the bottom
set cmdheight=2         " use 1 screen lines for command-line
"set nolazyredraw        " redraw while executing macros (for qbuf)
set lazyredraw        " redraw while executing macros (for qbuf)
set hidden              " allow to change buffer without saving
set backspace=2         " make backspace work normal
set whichwrap+=<,>,h,l  " allow backspace and cursor keys to wrap
set shortmess=atI       " shorten to avoid 'press a key' prompt
set report=0            " tell us when anything is changed via :...
set fillchars=vert:\ ,stl:\ ,stlnc:\
                        " make splitters between windows be blank
set showmatch           " show matching paren when a bracket inserted
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class,.lib,.exp,.pch,.res
set matchtime=2         " how many tenths of a second to blink
set ignorecase
set smartcase           " the case of normal letters is ignored except when upper is used
set hlsearch            " highlight all searched for phrases
set incsearch           " highlight where the typed pattern matches
map <silent> <leader><cr> :noh<cr>
                        " remove the highlight searched phrases
"set novisualbell        " use visual bell instead of beeping
set visualbell
set t_vb=
set noerrorbells        " do not make noise
" set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:‗,eol:↵
                        " how :set list show
set magic               " set magic on
set completeopt=menu    " use popup menu to show possible completions
" set foldenable          " enable folding, I find it very useful
set nofen               " enable folding, I find it very useful
"set foldmethod=syntax   " manual, marker, syntax, try set foldcolumn=2
set foldmethod=manual   " manual, marker, syntax, try set foldcolumn=2
set laststatus=2        " always show the status line
" set statusline=\ %F%m%r%h\ %w\ %{&ff}\ \ now:\ %r%{CurDir()}%h\ \ \ pos:\ %l/%L:%c

" default 'statusline' with 'fileencoding'.
let &statusline = ''
let &statusline .= '%<%f %h%m%r%w'
let &statusline .= '%='
" " temporary disabled.
" let &statusline .= '(%{' . s:SID_PREFIX() . 'vcs_branch_name(getcwd())}) '
let &statusline .= '[%{&fileencoding == "" ? &encoding : &fileencoding}]'
let &statusline .= '  %-14.(%l,%c%V%) %P'

set nomore              " more will fill the screen with project.vim
                        " format the statusline
fu! CurDir()
  let curdir = tolower(substitute(getcwd(), '$HOME', "~/", "g"))
  return curdir
endf

" if has("gui_running")   " highlight cursor line/column
"   if v:version >= 700
"     hi CursorColumn guibg=#333333
"     " desert cursorline
"     highlight CursorLine term=none cterm=none ctermbg=8
"   endif
" endif

" if v:version >= 700     " popmenu color setting
"   hi Pmenu guibg=#333333
"   hi PmenuSel guibg=#555555 guifg=#ffffff
" endif
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Search: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from an idea by Michael Naumann
fu! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endf

" press * or # to search for the current selection (part of word)
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving Around And Tabs: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map space to / and c-space to ?
"map <space> /
map <C-space> ?

" set H and L to first and last character of line
nnoremap H ^
nnoremap L $

" yank to end of line
nnoremap Y y$

" smart way to switch between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" To be able to undo these types of deletion in Insert mode.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>


" faster selection of tags
map <C-\> :tselect /<C-R><C-W>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


"Vertical split then hop to new buffer
" noremap ,v :vsp<CR><C-W><C-W>

" smart way to close windows
map <leader>wc <C-W>c

" actually, the tab does not switch buffers, but my arrows
" bclose function can be found in "Buffer related" section
"map <leader>bd :Bclose<cr>
map <leader>bc :Bclose<cr>
map <leader>bw :bw<cr>
" map <up> <esc>:NERDTreeToggle<cr>
" map <down> <esc>:Tlist<cr>
" use the arrows to do something useful
map <right> :bn<cr>
map <left> :bp<cr>
nnoremap <up> gk
nnoremap <down> gj

" tab configuration
" conflicts with stlref
"map <leader>tn :tabnew %<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
map <c-PageDown> :tabn<CR>
map <c-PageUp>   :tabp<CR>
"FIXME: disabled usetab
"try
  "set switchbuf=usetab
  "if has("gui_running") | set stal=1 | else | set stal=2 | endif
"catch
"endtry

" moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i

imap <c-e> <esc>A
imap <c-a> <esc>I

" switch to current dir
map <leader>cd :cd %:p:h<cr>
" }}}11

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis Bracket Expanding: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap z( <esc>`>a)<esc>`<i(<esc>
vnoremap z[ <esc>`>a]<esc>`<i[<esc>
vnoremap z{ <esc>`>a}<esc>`<i{<esc>
vnoremap z; <esc>`>a'<esc>`<i'<esc>
vnoremap z, <esc>`>a"<esc>`<i"<esc>

" Press {, (, [ and it will insert the corresponding {, (, [
"inoremap {{ {<cr>}<esc>kA<cr>
" inoremap {{ {<esc>o}<esc>:let leavechar="}"<cr>O
" inoremap (( ()<esc>:let leavechar=")"<cr>i
" inoremap [[ []<esc>:let leavechar="]"<cr>i
" inoremap ;; ''<esc>:let leavechar="'"<cr>i
" inoremap ,, ""<esc>:let leavechar='"'<cr>i


" map auto complete of (, [, {, ', "
inoremap z( ()<esc>:let leavechar=")"<cr>i
inoremap z[ []<esc>:let leavechar="]"<cr>i
inoremap z{ {}<esc>:let leavechar="}"<cr>i
inoremap z} {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap z; ''<esc>:let leavechar="'"<cr>i
inoremap z, ""<esc>:let leavechar='"'<cr>i

" auto match brackets
"inoremap { {<cr>}<esc>O <tab><esc>:let leavechar="}"<cr>i
"inoremap ( ()<esc>:let leavechar=")"<cr>i
"inoremap [ []<esc>:let leavechar="]"<cr>i
"imap <c-l> <esc>:exec "normal f" . leavechar<cr>a
imap zz <esc>:exec "normal f" . leavechar<cr>a
"au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
"au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i


"autocmd Syntax xml,html,vim inoremap < <lt>><ESC>i|
" }}}1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab xname Reza Jelveh
"}}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing Mappings Etc: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap Vim 0
map 0 ^
map <A-i> i <esc>r

" edit text in quotes
nmap X ci"

" move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

fu! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endf
au BufWrite *.py :call DeleteTrailingWS()
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cmdline Settings: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fu! DeleteTillSlash()
  let g:cmd = getcmdline()
  if has("unix")
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if has("unix")
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif
  return g:cmd_edited
endf

fu! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endf

" smart mappings on the cmdline
cno `h e ~/
cno `j e ./

cno `q <C-\>eDeleteTillSlash()<cr>
cno `c e <C-\>eCurrentFileDir("e")<cr>

cno `tc <C-\>eCurrentFileDir("tabnew")<cr>
cno `th tabnew ~/

fu! CurrentWord(cmd)
  "return a:cmd . " /" . expand("<cword>") . "/ " . "*.h *.c *.cpp"
  return a:cmd . " " . expand("<cword>") . " " . "*.h *.c *.cpp"
endf
cno `v <C-\>eCurrentWord("Rgrep")<cr><Home><S-Right><Right><Right>
map <c-q> :`v

" bash like
cno <C-A> <Home>
cno <C-F> <Right>
cno <C-B> <Left>
cno <Esc>b <S-Left>
cno <Esc>f <S-Right>

" }}}1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer Related: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fast open a buffer by search for a name
"map <c-q> :sb
" open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

" restore cursor position in previous editing session, :h 'viminfo'
set viminfo='10,\"100,:20,!,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" buffer - reverse everything ... :)
map <F8> ggVGg?

" don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

fu! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif
  if bufnr("%") == l:currentBufNum
    new
  endif
  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endf
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Related: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle search highlighting
" map <silent> \ :let @/=""<cr><esc>
map <silent> \ :nohl<cr>
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files And Backups: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{1
"set nobackup
set backupdir=$VIMDATA/backup
set directory=$VIMDATA/temp
"set nowritebackup
"set noswapfile
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Options: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set noexpandtab         " real tabs please!
set expandtab
set tabstop=8           " tab spacing
set softtabstop=2       " unify it
set shiftwidth=2        " unify it
"set smarttab            " use tabs at start of a line, spaces elsewhere
set fo=tcrqnmM		      " see help formatoptions (complex)
set linebreak           " wrap long lines at a character in 'breakat'
set textwidth=500       " maximum width of text that is being inserted
set ai                  " autoindent
" set si                  " smartindent
set cindent             " do C-style indenting
set cino=(0
set copyindent
set wrap                " wrap lines

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t8 :set shiftwidth=8<cr>
au FileType html,vim,javascript setl shiftwidth=2
au FileType html,vim,javascript setl tabstop=2
au FileType python setl tabstop=4 sw=4 sts=4 nosi

"noremap <leader>; :make<CR>
" Map ; to "add ; to the end of the line, when missing"
noremap <leader>; :s/\([^;]\)$/\1;/<cr>:let @/=""<cr><esc>

" }}}1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Checking: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  """"""""""""""""""""""""""""""
  " => grep.vim
  """"""""""""""""""""""""""""""
  let Grep_Skip_Dirs = 'RCS CVS SCCS .svn'
  let Grep_Skip_Files = '*.obj *.o tags .tmtags'
  let Grep_Default_Filelist = '*.[ch] *.cpp *.php *.html *.phtml *.rb'

  let Grep_Default_Options = '-i'
  if has("macunix") || has("gui_macvim")
    let Grep_Xargs_Options = '-0'
  endif


  if has("win32")
    let Grep_Path = 'c:\programme\gnuwin32\bin\grep.exe'
    let Fgrep_Path = 'c:\programme\gnuwin32\bin\fgrep.exe'
    let Egrep_Path = 'c:\programme\gnuwin32\bin\egrep.exe'
    let Agrep_Path = 'c:\programme\gnuwin32\bin\agrep.exe'
    let Grep_Find_Path = 'c:\programme\gnuwin32\bin\find.exe'
    let Grep_Xargs_Path = 'c:\programme\gnuwin32\bin\xargs.exe'
  endif


  map <S-F3> :Rgrep<cr>
  "let Grep_Cygwin_Find = 1
  

  """"""""""""""""""""""""""""""
  " => tovl grep
  """"""""""""""""""""""""""""""
  " command! -nargs=* BGgrep 
            " \ call tovl#plugin_management#Plugin('plugins#background_processes#grep#PluginBackgroundGrep').Dialog()


  """"""""""""""""""""""""""""""
  " => a.vim
  """"""""""""""""""""""""""""""
  map <silent> <leader>s :A<cr>


  """"""""""""""""""""""""""""""
  " => crefvim.vim
  """"""""""""""""""""""""""""""
  map <silent> <Leader>cc <Plug>CRV_CRefVimAsk
  vmap <silent> <Leader>cr <Plug>CRV_CRefVimVisual
  nmap <silent> <Leader>cr <Plug>CRV_CRefVimNormal


  """"""""""""""""""""""""""""""
  " => largefile.vim
  """"""""""""""""""""""""""""""
  let g:LargeFile = 3


  """"""""""""""""""""""""""""""
  " => taglist.vim
  """"""""""""""""""""""""""""""
  if has("win32")
    let Tlist_Ctags_Cmd = $VIMFILES.'\ctags.exe'
  elseif has("mac")
    let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
  endif

  let Tlist_Sort_Type = "name"         " order by name
  "let Tlist_Sort_Type = "order"
  let Tlist_Use_Right_Window = 1       " split to the right side
  let Tlist_Compart_Format = 1         " show small meny
  let Tlist_Exist_OnlyWindow = 1       " if it's the last, kill it
  let Tlist_File_Fold_Auto_Close = 0   " do not close tags for others
  let Tlist_Enable_Fold_Column = 0     " do not show folding tree
  let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
  let Tlist_Show_One_File = 1          " Displaying tags for only one file~
  let Tlist_Display_Prototype = 0      " do not show prototypes and not tags in the taglist window.
  let Tlist_Display_Tag_Scope = 1      " Show tag scope next to the tag name.
  "let Tlist_Close_On_Select = 1        " Close the taglist window when a file or tag is selected.
  let Tlist_WinWidth = 40
  map <leader>t :Tlist<cr>
  nnoremap <silent> <F4> :TlistToggle<CR>


  """"""""""""""""""""""""""""""
  " => project.vim
  """"""""""""""""""""""""""""""
  map <D-L> :Project<CR>
  map <D-R> :Project<CR>:redraw<CR>/
  nmap <silent> <leader>p <Plug>ToggleProject
  "let g:proj_flags = "cimst"    " Close Project window when file selected
  let g:proj_window_width = 25
  "let g:proj_window_increment = 50

  """"""""""""""""""""""""""""""
  " => projtags.vim
  """"""""""""""""""""""""""""""
  if has("win32")
   " doesn't seem to work
    let g:ProjTags = [["C:\Dev\Projects", "c:\dev\tags_psdk2003", "c:\dev\projects\integrator\tags"]]
    set tags=./tags,tags,c:\Dev\Projects\Integrator\tags,c:\Dev\tags_psdk2003    " used by CTRL-] together with ctags
  else
    let g:ProjTags = [["~/Documents/Projects/Acculogic/Integrator", "~/Documents/Projects/Acculogic/Integrator/.tmtags"]]
    let g:ProjTags += [["~/Sites/talentrun/talentrun", "~/Sites/talentrun/talentrun/.tmtags"]]
    let g:ProjTags += [["~/Sites/Studiblock/Frameworks/cake", "~/Sites/Studiblock/Frameworks/cake/.tmtags"]]
  endif


  """"""""""""""""""""""""""""""
  " => vcscommand.vim
  """"""""""""""""""""""""""""""
  nmap <Leader>va <Plug>VCSAdd
  nmap <Leader>vi <Plug>VCSInfo
  nmap <Leader>vn <Plug>VCSAnnotate
  nmap <Leader>vb <Plug>VCSAnnotate
  nmap <Leader>vc <Plug>VCSCommit
  nmap <Leader>vd <Plug>VCSVimDiff
  nmap <Leader>vg <Plug>VCSGotoOriginal
  nmap <Leader>vG <Plug>VCSGotoOriginal!
  nmap <Leader>vl <Plug>VCSLog
  nmap <Leader>vL <Plug>VCSLock
  nmap <Leader>vr <Plug>VCSReview
  nmap <Leader>vs <Plug>VCSStatus
  nmap <Leader>vu <Plug>VCSUpdate
  nmap <Leader>vU <Plug>VCSUnlock
  nmap <Leader>vv <Plug>VCSVimDiff
  nmap <Leader>vR <Plug>VCSRevert

  " vcscommand.vim - svn executable path
  if has("win32")
    let g:VCSCommandSVNExec = 'C:\Programme\Subversion\svn.exe'
  else
    let g:VCSCommandSVNExec = '/opt/local/bin/svn'
    let g:VCSCommandGitExec = '/opt/local/bin/git'
  endif

  augroup VCSCommand
    au VCSCommand User VCSBufferCreated silent! nmap <unique> <buffer> q :bwipeout<cr>
  augroup END


  """"""""""""""""""""""""""""""
  " => NERD_commenter.vim
  """"""""""""""""""""""""""""""
  let g:NERDComLineMap = ''
  let g:NERDSpaceDelims = 1

  """"""""""""""""""""""""""""""
  " => NERD_tree.vim
  """"""""""""""""""""""""""""""
  "noremap <C-E><C-E> :NERDTreeToggle<CR>
  nmap <silent> <F3> :execute 'NERDTreeToggle ' . fnameescape(getcwd())<CR>
  let g:NERDTreeHijackNetrw = 0

  """"""""""""""""""""""""""""""
  " => winmanager.vim
  """"""""""""""""""""""""""""""
  "noremap <silent><F3> :WMToggle<CR>


  """"""""""""""""""""""""""""""
  " => imaps.vim
  """"""""""""""""""""""""""""""
   nmap <C-I><C-I> <Plug>IMAP_JumpForward

  """"""""""""""""""""""""""""""
  " => supertab.vim
  """"""""""""""""""""""""""""""
  "let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

  """"""""""""""""""""""""""""""
  " => marks_corey.vim
  """"""""""""""""""""""""""""""
  nmap <Leader>md <Plug>Remove_all_signs
  nmap <Leader>mm <Plug>Place_sign
  nmap <Leader>mn <Plug>Goto_next_sign
  nmap <Leader>mp <Plug>Goto_prev_sign
  nmap <Leader>m. <Plug>Move_sign

  """"""""""""""""""""""""""""""
  " => gist.vim
  """"""""""""""""""""""""""""""
  let g:gist_clip_command = 'xclip -selection clipboard'

  """"""""""""""""""""""""""""""
  " => bufexplorer.vim
  """"""""""""""""""""""""""""""
  "let g:bufExplorerSplitHorzSize = 15
  let g:bufExplorerDefaultHelp = 0
  let g:bufExplorerShowRelativePath = 1

  """"""""""""""""""""""""""""""
  " => lineup.vim
  """"""""""""""""""""""""""""""
  " might as well use alignmaps but thats a bit overkill
  vnoremap <Leader>t= :Lineup=<CR>
  vnoremap <Leader>t/ :Lineup/<CR>

  """"""""""""""""""""""""""""""
  " => fuzzyfinder.vim
  """"""""""""""""""""""""""""""
  " Fuzzy finder rocks, like Command-T in TextMate (buggy at moment, fix!!)
  let g:FuzzyFinderOptions = { 'Base':{}, 'Bookmark':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Tag':{}, 'TaggedFile':{}}
  let g:FuzzyFinderOptions.Buffer.mode_available = 1
  let g:FuzzyFinderOptions.Bookmark.mode_available = 1
  let g:FuzzyFinderOptions.File.mode_available = 1
  let g:FuzzyFinderOptions.MruFile.mode_available = 1
  let g:FuzzyFinderOptions.MruCmd.mode_available = 0
  let g:FuzzyFinderOptions.Dir.mode_available = 1
  let g:FuzzyFinderOptions.Tag.mode_available = 1
  let g:FuzzyFinderOptions.TaggedFile.mode_available = 0
  let g:FuzzyFinderOptions.Base.abbrev_map = { "^Project-" : ["**/"], }
  let g:FuzzyFinderOptions.Base.migemo_support = 0
  "let g:FuzzyFinderOptions.Base.key_open_split = '<C-O>'
  let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.obj$|\.jpg$|\.gif$|\.o$|\./|\.git/|\.svn/|\.DS_Store|\.exe$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)'
  noremap <leader>fp :FuzzyFinderFile Project-<CR>
  noremap <leader>ff :FuzzyFinderFile<CR>
  noremap <leader>fb :FuzzyFinderBuffer<CR>
  noremap <leader>fm :FuzzyFinderMruFile<CR>
  noremap <leader>fv :FuzzyFinderBookmark<CR>
  noremap <leader>fa :FuzzyFinderAddBookmark<CR>
  noremap <leader>fd :FuzzyFinderDir<CR>
  noremap <leader>ft :FuzzyFinderTag<CR>
  noremap <leader>fc :FuzzyFinderRemoveCache<CR>
  noremap <leader>t :FuzzyFinderTextMate<CR>
  noremap <leader>fr :FuzzyFinderTextMateRefreshFiles<CR>


  let g:fuzzy_ignore = "*.log;*.o;*.jpg;*.gif;*png;.svn;application/cache/**"

  """"""""""""""""""""""""""""""
  " => xml.vim
  """"""""""""""""""""""""""""""
  let xml_tag_completion_map = "<C-l>"


  """"""""""""""""""""""""""""""
  " => yankring.vim
  """"""""""""""""""""""""""""""
   map <leader>yr :YRShow<cr>

  """"""""""""""""""""""""""""""
  " => autocomplpop.vim
  """"""""""""""""""""""""""""""
  let g:AutoComplPop_NotEnableAtStartup = 1
  map ,ace :AutoComplPopEnable<CR>
  map ,acd :AutoComplPopDisable<CR>

  """"""""""""""""""""""""""""""
  " => C/C++ Stuff
  """"""""""""""""""""""""""""""
  autocmd FileType c call <SID>CProgSettings()
  function! s:CProgSettings()
    iabbrev stdio #include <stdio.h>
    iabbrev stdlib #include <stdlib.h>
    iabbrev main_ int main ()<CR>{<CR>return 0;<CR>}<ESC>2ka
    " used to be useful for test programs, now I almost always use a Makefile
    " ...maybe a stock Makefile that just compiles any .c files to a.out would
    " be nice for simple, small tests
    "set makeprg=gcc\ -Wall\ -pedantic-errors\ -ansi\ -g\ %
    " syn region Block start="{" end="}" transparent fold
    "set foldtext=substitute(getline(v:foldstart),'{.*','{...}','')
    "syn region cFuncBody
    "      \ start='^{\ze\s*\%(\n}\@!\%(.*\)\@>\)*\n}\s*$'
    "      \ end='^}\s*$'
    "      \ fold transparent
  endfunction
  " for some reason this must be outside of CProgSettings()

 " some C++ shortcuts
  autocmd FileType cpp call <SID>CppProgSettings()
  function! s:CppProgSettings()
    "set makeprg=g++\ -ansi\ -pedantic\ -Wall\ -g\ %
    call <SID>CProgSettings()
  endfunction


  """"""""""""""""""""""""""""""
  " => dbext.vim
  """"""""""""""""""""""""""""""
  let g:debext_default_type = 'MYSQL'
  let g:dbext_default_profile_mysql = 'type=MYSQL:user=root:passwd=:dbname=mysql:extra=-t'
  let g:dbext_default_MYSQL_bin = '/Applications/xampp/xamppfiles/bin/mysql'

  """"""""""""""""""""""""""""""
  " => Others
  """"""""""""""""""""""""""""""
  " a.vim          - alternate files fast (.c -> .h)
  " supertab.vim   - map <Tab> to SuperTab() function
  " lookupfile.vim - filename tags generated by find
  let g:LookupFile_TagExpr = '"./filenametags"'
  let g:LookupFile_DefaultCmd = ':LUBufs'
  " calendar.vim   - folder to store diary
  let g:calendar_diary = $VIMDATA.'/diary'
  " mru.vim        - file to save mru entries
  let MRU_File = $VIMDATA.'/_vim_mru_files'
  let MRU_Max_Entries = 20
  " favmenu.vim    - file to save favorite items
  let FAV_File = $VIMDATA.'/_vim_fav_files'
  " yankring.vim   - map :YRShow
  map <leader>y :YRShow<cr>
  " doxygentoolkit.vim - map :Dox
  map <leader>d :Dox<cr>
  " doxygen.vim    - load doxygen syntax for c/cpp/idl
  "let load_doxygen_syntax = 1
  map <C-F11> :!/opt/local/bin/ctags -f .tmtags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
  map <C-F12> :%!astyle -t -b -S -w -M -p -U<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cope: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>
" map <leader>c :botright cw 10<cr>
" toggle quickfix
map <silent> \` <ESC>:QFix<cr>
imap <silent> \` <ESC>:QFix<cr>
"map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>
" close quickfix window with q
"au BufReadPost quickfix nmap q :bw<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCompletion: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map omni complete to ctrl-f
inoremap <C-F> <C-X><C-O>
" inoremap <C-L> <C-P>
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 1
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Development
augroup development
    autocmd!
    autocmd Filetype c,cpp setl cindent nowrap number textwidth=0
    autocmd Filetype objc,objcpp setl cindent nowrap number textwidth=0
    autocmd FileType make,php,sh,javascript,perl,css,dosbatch,python,xml,idlang setl nowrap number textwidth=0
    autocmd FileType html setl number textwidth=0
    "autocmd BufWritePost *.cpp,*.h,*.c call UpdateCTags()
    autocmd Filetype taglist setl statusline=Taglist
    autocmd FileType make set noet ts=8 sw=8 nosi
    autocmd FileType mkd set ai formatoptions=tcroqn2 comments=n:>
augroup END

" this allows us to write to files even when we 
" forget to use sudo to launch vim
command! -bar -nargs=0 Sudow :silent exe "w !sudo tee % > /dev/null" | silent edit!


" use jj for esc hh for dvorak
imap jj <Esc>

" go to newline
imap <M-o> <Esc>o

" map custom completion to ctrl-j
inoremap <C-J> <C-X><C-U>

" convert last word to uppercase
imap <c--> <esc>gUiw`]a
" doesnt work in Terminal.app otherwise
imap <c-_> <esc>gUiw`]a

if has('gui_macvim')
  " ---------------------------
  " Some Window Settings
  " ---------------------------
  map <D-left> <c-W><left>
  map <D-up> <c-W><up>
  map <D-down> <c-W><down>
  map <D-right> <c-W><right>
  map <D-=> <c-W>+
  map <D--> <c-W>-
  map <D-S-w> <c-W>c

  " ---------------------------------
  " mimic some of textmates behavior
  " ---------------------------------
  " command enter
  imap <D-cr> <c-o>o
  " command shift enter
  imap <D-S-cr> <c-o>o
  imap <D-A-cr> <c-o>o
  autocmd FileType c,cpp,objc,objcpp,php imap <D-S-cr> <ESC>A;<ESC>o
  autocmd FileType c,cpp,objc,objcpp,php imap <D-A-cr> <ESC>A;<ESC>
  let g:hlrainbow = "[]"
  " autocmd set tabstop=2 shiftwidth=2
  imap <D-]> <C-T>
  imap <D-#> <C-T>
  imap <D-[> <C-D>
  imap <D-!> <C-D>
  " show files
  nmap <D-t> :e **/
else
  map <M-left> <c-W><left>
  map <M-up> <c-W><up>
  map <M-down> <c-W><down>
  map <M-right> <c-W><right>
endif

" toggle folds with space
nnoremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'1')<cr>
" create fold in visual mode
vnoremap <space> zf
" Toggle fold state between closed and opened.
"
"nnoremap <space> :call ToggleFold()<CR>
" this fold hotkey will go one character left after folding
"nnoremap <silent> <Space> :exe 'silent! normal! za'.(foldlevel('.')?'h':'')<CR>
"map <space> <c-f>
"map <S-space> <c-b>
"map <Space><Space> <c-W>W<c-W>_
"nmap <S-space> :
"imap <S-space> <Esc>

"set foldlevel=1
inoremap <C-G> <Esc>gUiw`]a

" xml
let g:xml_use_xhtml = 1
let g:xml_use_html = 1

let g:rails_default_database="mysql"


" jump to line at cursor
map <F5> [I:let nr = input("Which one: ") <Bar>exe "normal " . nr ."[\t"<CR>

" remove the windows ^M
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

" super paste
inoremap <C-V> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

" copy into clipboard
vnoremap <C-C> "+y

" select range, hit :call SuperRetab($width) - by p0g and FallingCow
fu! SuperRetab(width) range
  sil! exe a:firstline.','.a:lastline.'s/\v%(^ *)@<= {'. a:width .'}/\t/g'
endf

" inserts links & anchors on a TOhtml export.
" Usage:
"   *> Link
"   => Anchor
fu! SmartTOhtml()
  let g:html_use_encoding = toupper(&fileencoding)
  let g:html_use_css = 1
  TOhtml
  try
    %s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
  catch
  endtry
  exe ":w!"
  exe ":bd"
endf


" ------------------------
" Change Working Directory: {{{1
" -----------------------

"function! CHANGE_CURR_DIR()
    "let _dir = expand("%:p:h")
    "if _dir !~ '^/tmp'
      "exec "cd %:p:h"
    "endif
    "unlet _dir
"endfunction

"autocmd BufEnter * call CHANGE_CURR_DIR()


if has("win32")
  " windows ddk, driver develop kit
  set makeprg=for\ \%c\ in\ (\"pushd\ .\"\ \"setenv\ D:\\foo\\WINDDK\\2600\ chk\"\ \"popd\"\ \"build\ -cZ\"\ \"copy\ i386\\ds30xx.sys\ e:\\work\\X\\i386\")\ do\ call\ \%~c
endif

"if filereadable($VIMDATA."/session.vim")
"  au VimEnter * so $VIMDATA/session.vim
"endif
"au VimLeavePre * mks! $VIMDATA/session.vim
" don't load the python stuff as root, i.e. sudo
let myuid=substitute(system('id'), '^uid=\([0-9]*\)(.*', '\1', "")
if myuid != "0"
fu! DoRunPyBuffer2()
pclose! " force preview window closed
setlocal ft=python

" copy the buffer into a new window, then run that buffer through python
sil %y a | below new | sil put a | sil %!python -
" indicate the output window as the current previewwindow
setlocal previewwindow ro nomodifiable nomodified

" back into the original window
winc p
endfu

command! RunPyBuffer call DoRunPyBuffer2()
"map <Leader>p :RunPyBuffer<CR>

"python << EOF

"import vim

"def SetBreakpoint():
"  import re

"  nLine = int( vim.eval( 'line(".")'))

"  strLine = vim.current.line
"  strWhite = re.search( '^(\s*)', strLine).group(1)

"  vim.current.buffer.append(
"     "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
"     {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

"  for strLine in vim.current.buffer:
"    if strLine == "import pdb":
"      break
"  else:
"    vim.current.buffer.append( 'import pdb', 0)
"    vim.command( 'normal j1')

"vim.command( 'map <f7> :py SetBreakpoint()<cr>')

"def RemoveBreakpoints():
"  import re

"  nCurrentLine = int( vim.eval( 'line(".")'))

"  nLines = []
"  nLine = 1
"  for strLine in vim.current.buffer:
"    if strLine == 'import pdb' or strLine.lstrip()[:15] == 'pdb.set_trace()':
"      nLines.append( nLine)
"    nLine += 1

"  nLines.reverse()

"  for nLine in nLines:
"    vim.command( 'normal %dG' % nLine)
"    vim.command( 'normal dd')
"    if nLine < nCurrentLine:
"      nCurrentLine -= 1

"  vim.command( 'normal %dG' % nCurrentLine)

"vim.command( 'map <s-f7> :py RemoveBreakpoints()<cr>')

"def RunDebugger():
"  vim.command( 'wall')
"  strFile = vim.eval( "g:mainfile")
"  vim.command( "!start python -m pdb %s" % strFile)

"vim.command( 'map <s-f12> :py RunDebugger()<cr>')


"EOF
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set et ft=vim tw=78 path+=$VIMFILES/* tags+=$VIMRUNTIME/doc/tags:
