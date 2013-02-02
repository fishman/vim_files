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
"   ------ *> tagbar.vim
"   ------ *> project.vim
"   ------ *> projtags.vim
"   ------ *> fugitive.vim
"   ------ *> NERD_commenter.vim
"   ------ *> NERD_tree.vim
"   ------ *> winmanager.vim
"   ------ *> session.vim
"   ------ *> dbext.vim
"   ------ *> supertab.vim
"   ------ *> marks_corey.vim
"   ------ *> bufexplorer.vim
"   ------ *> lineup.vim
"   ------ *> xml.vim
"   ------ *> yankring.vim
"   ------ *> SingleCompile.vim
"   ------ *> C/C++ stuff
"   ------ *> clang_complete
"   ------ *> jedi.vim
"   ------ *> vimux.vim
"   ------ *> Others
"   *> Cope
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
filetype plugin indent on      " enable filetype plugin

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
  let $VIMDATA  = $HOME.'/vimdata'
  let $VIMFILES = $HOME.'/vimfiles'
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
elseif has("gui_mac")
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
  set guioptions-=Tm
  set guioptions=age
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
    " colo hybrid
    " colo desertc
    " colo leo
    " colo gardener
    " colo inkpot

  elseif $TERM == "xterm-color"
    colo desert
  elseif $TERM == "screen-256color"
    " simply use c-v to create these maps
    noremap [1;5D <c-left>
    noremap [1;5C <c-right>
    noremap [1;2D <s-left>
    noremap [1;2C <s-right>
    inoremap [1;5D <c-left>
    inoremap [1;5C <c-right>
    inoremap [1;2D <s-left>
    inoremap [1;2C <s-right>
    cnoremap [1;5D <c-left>
    cnoremap [1;5C <c-right>
    cnoremap [1;2D <s-left>
    cnoremap [1;2C <s-right>
    inoremap OP <C-O>:w!<cr>

    " fix mouse selection dragging and scrolling
    set ttymouse=xterm2

    colo wombat256mod
  else
    "colo desert
    colo wombat256mod
  endif
endif

" set runtimepath+=$VIMFILES/runtime/theonevimlib/core
" set runtimepath+=$VIMFILES/runtime/theonevimlib/contrib
" call theonevimlibsetup#Setup()

" set runtimepath+=$VIMFILES/runtime/cocoa.vim
" " set runtimepath+=$VIMFILES/runtime/cocoa.vim/after
" set runtimepath+=$VIMFILES/runtime/theonevimlib/contrib
" set runtimepath+=$VIMFILES/runtime/nerdsnippets
" set runtimepath+=$VIMFILES/runtime/vimoutliner
" set runtimepath+=$VIMFILES/runtime/git-vim
" set runtimepath+=$VIMFILES/runtime/nerdtree
" " set runtimepath+=~/.vim/runtime/snipMate

call pathogen#infect()
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"
"" let Vundle manage Vundle
"" required!
"Bundle 'gmarik/vundle'
"" stuff
"Bundle "git://github.com/vim-ruby/vim-ruby.git"
"Bundle "git://github.com/tpope/vim-rails.git"
"Bundle "git://github.com/tpope/vim-endwise.git"
"Bundle "git://github.com/tpope/vim-fugitive.git"
"Bundle "git://github.com/scrooloose/nerdtree.git"
"Bundle "git://github.com/scrooloose/nerdcommenter.git"
"Bundle "git://github.com/majutsushi/tagbar.git"
"Bundle "git://github.com/kien/ctrlp.vim.git"
"Bundle 'ultrasnips'
" go back to old snippets
" Bundle "git://github.com/MarcWeber/vim-addon-mw-utils.git"
" Bundle "git://github.com/tomtom/tlib_vim.git"
" Bundle "git://github.com/honza/snipmate-snippets.git"
" Bundle "git://github.com/garbas/vim-snipmate.git"
" Bundle "git://github.com/drmingdrmer/xptemplate.git"
" Bundle "nerdsnippets"


if has("win32")
  set rtp+=$VIMFILES/runtime/win
  runtime plugin/visual_studio.vim
endif

" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7         " minimal screen lines above/below cursor
set wildmenu            " :h and press <Tab> to see what happens
set wig=*.o,*.pyc,*.tiff,*.jpg,*.tif,*.gif,.git,.svn,*.pdf,*.png,build,*.beam
                        " type of file that will not in wildmenu
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
"set novisualbell        " use visual bell instead of beeping
set visualbell
set t_vb=
set noerrorbells        " do not make noise
if has("multi_byte_encoding")
  set listchars=tab:»\ ,trail:·,extends:>,precedes:<,eol:¬
else
  set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
endif
                        " how :set list show
set list
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

" tag next prev
nmap <leader>tn :tn<cr>
nmap <leader>tp :tp<cr>

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

" imap <c-e> <esc>A
" imap <c-a> <esc>I

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
"imap zz <esc>:exec "normal f" . leavechar<cr>a
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
    enew
  endif
  if buflisted(l:currentBufNum)
    execute "bdelete! ".l:currentBufNum
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
set nobackup
set backupdir=$VIMDATA/backup
set directory=$VIMDATA/temp
"set nowritebackup
"set noswapfile
" }}}1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Options: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
" set smarttab            " use tabs at start of a line, spaces elsewhere
set fo=tcrqnmM		      " see help formatoptions (complex)
set linebreak           " wrap long lines at a character in 'breakat'
set textwidth=500       " maximum width of text that is being inserted
set ts=4 sts=4 sw=4
au FileType mail setl textwidth=78
set ai                  " autoindent
" set si                  " smartindent
" set copyindent
set wrap                " wrap lines

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t8 :set shiftwidth=8<cr>

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
  let Grep_Default_Filelist = '*.[ch] *.cpp *.php *.html *.phtml *.rb *.erb *.eco *.coffee'

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
  " => tagbar.vim
  """"""""""""""""""""""""""""""
  nnoremap <silent> <F4> :TagbarToggle<CR>
  let g:tagbar_type_coffee = {
        \ 'ctagstype' : 'coffee',
        \ 'kinds' : [
        \   'n:namespace',
        \   'c:class',
        \   'o:object',
        \   'm:methods',
        \   'f:functions',
        \   'i:instance variables',
        \   'v:var:1',
        \ ],
        \ 'sro' : ".",
        \ 'scope2kind' : {
        \   'o' : 'object',
        \   'f' : 'function',
        \   'm' : 'method',
        \   'v' : 'var',
        \   'i' : 'ivar'
        \ },
        \ 'kind2scope' : {
        \  'function' : 'f',
        \  'method' : 'm',
        \  'var' : 'v',
        \  'ivar' : 'i',
        \ 'object' : 'o'
        \}
        \}

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
  " => fugitive.vim
  """"""""""""""""""""""""""""""
  nmap <Leader>va :Gwrite<cr>
  nmap <Leader>vc :Gcommit<cr>
  nmap <Leader>vr :Gread<cr>
  nmap <Leader>vs :Gstatus<cr>
  nmap <Leader>vd :Gdiff<cr>

  autocmd QuickFixCmdPost *grep* cwindow


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
  " => ctrlp.vim
  """"""""""""""""""""""""""""""
  " {{{
  noremap <silent> <M-t> :CtrlP<CR>
  noremap <silent> <leader>t :CtrlP<CR>
  noremap <silent> <leader>tb :CtrlPBuffer<CR>
  noremap <silent> <leader>m :CtrlPMRU<CR>
  let g:ctrlp_persistence_input = 0
  let g:ctrlp_by_filename = 0

  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$\|vendor\/bundle\|bin\|gen\|target',
        \ 'file': '\.exe$\|\.so$\|\.dat$|\.gem$\|\.class$\|\.dex$',
        \ 'link': 'some_bad_symbolic_links'
        \ }
  " }}}

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
  if has("macunix")
    let g:gist_clip_command = 'pbcopy'
  elseif has("unix")
    let g:gist_clip_command = 'xclip -selection clipboard'
  endif

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
  " => xml.vim
  """"""""""""""""""""""""""""""
  let xml_tag_completion_map = "<C-l>"

  """"""""""""""""""""""""""""""
  " => vim-javascript.vim
  """"""""""""""""""""""""""""""
  let g:html_indent_inctags = "html,body,head,tbody"
  let g:html_indent_script1 = "inc"
  let g:html_indent_style1 = "inc"

  """"""""""""""""""""""""""""""
  " => javacomplete.vim
  """"""""""""""""""""""""""""""
  " let g:java_classpath      = "/opt/android-sdk/platforms/android-16/android.jar"

  """"""""""""""""""""""""""""""
  " => yankring.vim
  """"""""""""""""""""""""""""""
  map <leader>y :YRShow<cr>

  """"""""""""""""""""""""""""""
  " => SingleCompile.vim
  """"""""""""""""""""""""""""""
  nnoremap <F9>  :SCCompile<cr>
  nnoremap <F10> :SCCompileRun<cr>
  inoremap <F9>  <c-o>:SCCompile<cr>
  inoremap <F10> <c-o>:SCCompileRun<cr>

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
  " => session.vim
  """"""""""""""""""""""""""""""
  let g:session_autosave = 1
  " let g:session_default_to_last = 1
  " let g:session_autoload = 1


  """"""""""""""""""""""""""""""
  " => dbext.vim
  """"""""""""""""""""""""""""""
  let g:debext_default_type = 'MYSQL'
  let g:dbext_default_profile_local_mysql = 'type=MYSQL:user=root:dbname=mysql=-t'
  let g:dbext_default_MYSQL_bin = 'mysql'

  """"""""""""""""""""""""""""""
  " => jedi.vim
  """"""""""""""""""""""""""""""
  let g:jedi#use_tabs_not_buffers = 0
  let g:jedi#popup_on_dot = 0

  """"""""""""""""""""""""""""""
  " => vimux.vim
  """"""""""""""""""""""""""""""
  map <leader><space> :call VimuxRunLastCommand()<cr>
  " Prompt for a command to run
  map <Leader>rp :VimuxPromptCommand<CR>
  " Inspect runner pane
  map <Leader>ri :VimuxInspectRunner<CR>
  " Close all other tmux panes in current window
  map <Leader>rx :VimuxClosePanes<CR>
  " Close vim tmux runner opened by VimuxRunCommand
  map <Leader>rq :VimuxCloseRunner<CR>
  " Interrupt any command running in the runner pane
  map <Leader>rs :VimuxInterruptRunner<CR>
  " If text is selected, save it in the v buffer and send that buffer it to tmux
  vmap <Leader>rv "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
  " Run the current file with rspec
  map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>





  """"""""""""""""""""""""""""""
  " => Others
  """"""""""""""""""""""""""""""
  " a.vim          - alternate files fast (.c -> .h)
  " supertab.vim   - map <Tab> to SuperTab() function
  " calendar.vim   - folder to store diary
  let g:calendar_diary = $VIMDATA.'/diary'
  " mru.vim        - file to save mru entries
  let MRU_File = $VIMDATA.'/_vim_mru_files'
  let MRU_Max_Entries = 20
  " favmenu.vim    - file to save favorite items
  let FAV_File = $VIMDATA.'/_vim_fav_files'
  " doxygentoolkit.vim - map :Dox
  map <leader>d :Dox<cr>
  " doxygen.vim    - load doxygen syntax for c/cpp/idl
  "let load_doxygen_syntax = 1
  map <C-F11> :!/opt/local/gentoo/usr/bin/ctags -f .tmtags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
  map <C-F12> :%!astyle -t -b -S -w -M -p -U<cr>



  """"""""""""""""""""""""""""""
  " => UltiSnips
  """"""""""""""""""""""""""""""
  " {{{
  " let g:UltiSnipsSnippetDirectories = [hostname() == 'osse-vb' && hostname() == 'ow-linux' ?
  "       \ "work_snippets" : "osse_snippets", "UltiSnips"]
  let g:UltiSnipsDontReverseSearchPath = "1"
  let g:UltiSnipsExpandTrigger         = "<Tab>"
  let g:UltiSnipsJumpForwardTrigger    = "<Tab>"
  let g:UltiSnipsJumpBackwardTrigger   = "<S-tab>"
  let g:UltiSnipsListSnippets          = "<leader>ls"
  " }}}


  """"""""""""""""""""""""""""""
  " => latex
  """"""""""""""""""""""""""""""
  " {{{
  let g:tex_fold_enabled = 1
  let g:tex_flavor = "latex"
  let g:tex_conceal = 'sgdm'
  let g:tex_comment_nospell = 1
  " }}}


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " clang_complete: {{{
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " map omni complete to ctrl-f
  inoremap <C-F> <C-X><C-O>
  " map custom completion to ctrl-j
  inoremap <C-J> <C-X><C-U>
  let g:clang_complete_copen = 0
  let g:clang_complete_auto = 0
  let g:clang_snippets = 1
  let g:clang_snippets_engine = 'ultisnips'
  let g:clang_use_library = 0
  " }}}


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => dwm {{{
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " smart way to switch between windows
  let g:dwm_map_keys = 0

  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l
  nmap <C-,> <Plug>DWMRotateCounterclockwise
  nmap <C-N> <Plug>DWMNew
  nmap <C-C> <Plug>DWMClose
  nmap <C-_> <Plug>DWMShrinkMaster
  nmap <C-+> <Plug>DWMGrowMaster


  " inoremap <C-L> <C-P>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cope: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap + :cn<cr>
nmap - :cp<cr>
nmap g+ :cnf<cr>
nmap g- :cpf<cr>
com! Cclear :cex[]
" map <leader>c :botright cw 10<cr>
" toggle quickfix
map <silent> <leader>` <ESC>:QFix<cr>
imap <silent> <leader>` <ESC>:QFix<cr>
"map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>
" close quickfix window with q
"au BufReadPost quickfix nmap q :bw<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc: {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Development
augroup development
    autocmd!
    autocmd Filetype c,cpp setl nu cindent cino=(0 nowrap textwidth=0 ts=4 sw=4 sts=4 et
    autocmd Filetype objc,objcpp setl nu cindent cino=(0 nowrap textwidth=0 ts=4 sw=4 sts=4 et
    autocmd FileType make,php,sh,javascript,perl,css,dosbatch,python,xml,idlang setl nowrap textwidth=0
    autocmd FileType html,javascript setl cindent cino=J1 textwidth=0 ts=2 sw=2
    autocmd FileType haskell setl textwidth=0 ts=2 sw=2 sts=2 et
    "autocmd BufWritePost *.cpp,*.h,*.c call UpdateCTags()
    autocmd Filetype taglist setl statusline=Taglist
    autocmd FileType make set noet ts=8 sw=8 nosi
    autocmd FileType mkd set ai formatoptions=tcroqn2 comments=n:>
    au FileType vim setl sw=2 ts=2
    au FileType python setl tabstop=4 et sw=4 sts=4 nosi omnifunc=pythoncomplete#Complete
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
    au BufRead,BufNewFile *.eco setl ft=eco.html sw=2 ts=2 et sts=2
    au BufRead,BufNewFile *.vra set ft=scope syntax=scope
    au BufRead,BufNewFile *.json.jbuilder set ft=ruby
    au BufNewFile,BufRead *.gradle setf groovy
    " Vala/Genie Support -------------------------------- {{{
    " get vala.vim here:
    " https://live.gnome.org/Vala/Vim
    autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    autocmd BufRead,BufNewFile *.vala setl et ts=4 sts=4 sw=4 nu cindent cino=(0 filetype=vala
    autocmd BufRead,BufNewFile *.vapi setl et ts=4 sts=4 sw=4 nu cindent cino=(0 filetype=vala
    autocmd FileType vala setlocal cindent

    " indentation for genie: genie.vim
    " http://www.vim.org/scripts/script.php?script_id=2349
    " This will overrule the default filetype grads
    autocmd BufRead,BufNewFile *.gs setlocal filetype=genie

    autocmd FileType vala,genie setlocal formatoptions+=croql
    " }}}

    " Python Support ------------------------------------ {{{
    autocmd FileType python setl omnifunc=pythoncomplete#Complete
    autocmd FileType python inoreab <buffer> #! #!/usr/bin/env python
    autocmd FileType python inoreab <buffer> #e # -*- coding: utf=8 -*-
    " }}}

    autocmd User Rails Rnavcommand bmodel app/assets/javascripts/models -glob=**/* -suffix=.js.coffee
    autocmd User Rails Rnavcommand bcollection app/assets/javascripts/collections -glob=**/* -suffix=.js.coffee
    autocmd User Rails Rnavcommand brouter app/assets/javascripts/routers -glob=**/* -suffix=.js.coffee
    autocmd User Rails Rnavcommand bview app/assets/javascripts/views -glob=**/* -suffix=.js.coffee
    autocmd User Rails Rnavcommand btemplate app/assets/templates -glob=**/* -suffix=.jst.eco


    " templates {{{
    autocmd BufNewFile  proguard.cfg        :r ~/.vim/skeletons/proguard.cfg
    autocmd BufNewFile  *Activity.java      :r ~/.vim/skeletons/activity.java
    autocmd BufNewFile  *.jbuilder          :r ~/.vim/skeletons/json.jbuilder
    autocmd BufNewFile  PKGBUILD            :r ~/.vim/skeletons/PKGBUILD
    autocmd BufNewFile  *.textile           :r ~/.vim/skeletons/blogpost.textile
    " }}}

    autocmd FileType snippets setl noet

augroup END

augroup TEXT
  " Allows to read PDF files with VIM by piping them through pdftotext
  autocmd BufReadPre *.pdf set ro
  autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78

  " Same for word files with antiword
  autocmd BufReadPre *.doc set ro
  autocmd BufReadPost *.doc %!antiword "%"

  autocmd BufReadPre *.docx set ro
  autocmd BufReadPost *.docx %!antiword-xp "%"
augroup END

" this allows us to write to files even when we
" forget to use sudo to launch vim
command! -bar -nargs=0 Sudow :silent exe "w !sudo tee % > /dev/null" | silent edit!


" use jj for esc hh for dvorak
" imap hh <Esc>

" go to newline
imap <M-o> <Esc>o

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
noremap <leader>dos mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''


function! ToggleSuperpaste()
  if exists("g:superpaste_on")
    unlet g:superpaste_on
    iunmap <C-V>
    vunmap <C-C>
  else
    let g:superpaste_on = 1
    " super paste
    inoremap <C-V> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
    " copy into clipboard
    vnoremap <C-C> "+y
  endif
endfunction

" Cheapo todo management
noremap <silent><leader>td  :call ToggleSuperpaste()<CR>s<C-V>u2713<C-O>:call ToggleSuperpaste()<CR><esc>

call ToggleSuperpaste()

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
