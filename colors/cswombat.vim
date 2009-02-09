" This scheme was created by CSApproxSnapshot
" on Thu, 11 Dec 2008

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = 'cswombat'

if 0
elseif has("gui_running") || &t_Co == 256
    highlight Normal term=NONE cterm=NONE ctermbg=235 ctermfg=230 gui=NONE guibg=#242424 guifg=#f6f3e8
    highlight Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=bg gui=NONE guibg=bg guifg=bg
    highlight Error term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    highlight Todo term=NONE cterm=NONE ctermbg=226 ctermfg=245 gui=NONE guibg=Yellow guifg=#8f8f8f
    highlight String term=NONE cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#95e454
    highlight Number term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e5786d
    highlight Function term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#cae682
    highlight SpecialKey term=NONE cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#343434 guifg=#808080
    highlight NonText term=NONE cterm=NONE ctermbg=236 ctermfg=244 gui=NONE guibg=#303030 guifg=#808080
    highlight Directory term=NONE cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=Cyan
    highlight ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=Red guifg=White
    highlight IncSearch term=NONE cterm=NONE ctermbg=fg ctermfg=bg gui=NONE guibg=bg guifg=fg
    highlight Search term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    highlight MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=SeaGreen
    highlight ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    highlight LineNr term=NONE cterm=NONE ctermbg=16 ctermfg=101 gui=NONE guibg=#000000 guifg=#857b6f
    highlight projectDescriptionDir term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight projectCD term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight Pmenu term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#f6f3e8
    highlight PmenuSel term=NONE cterm=NONE ctermbg=186 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    highlight PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    highlight PmenuThumb term=NONE cterm=NONE ctermbg=fg ctermfg=bg gui=NONE guibg=bg guifg=fg
    highlight TabLine term=underline cterm=underline ctermbg=248 ctermfg=fg gui=underline guibg=DarkGrey guifg=fg
    highlight TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    highlight TabLineFill term=NONE cterm=NONE ctermbg=fg ctermfg=bg gui=NONE guibg=bg guifg=fg
    highlight CursorColumn term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    highlight CursorLine term=NONE cterm=NONE ctermbg=236 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    highlight Cursor term=NONE cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#656565 guifg=fg
    highlight Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#8ac6f2
    highlight Question term=bold cterm=bold ctermbg=bg ctermfg=46 gui=bold guibg=bg guifg=Green
    highlight StatusLine term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#f6f3e8
    highlight StatusLineNC term=NONE cterm=NONE ctermbg=238 ctermfg=101 gui=NONE guibg=#444444 guifg=#857b6f
    highlight VertSplit term=NONE cterm=NONE ctermbg=238 ctermfg=238 gui=NONE guibg=#444444 guifg=#444444
    highlight Title term=bold cterm=bold ctermbg=bg ctermfg=230 gui=bold guibg=bg guifg=#f6f3e8
    highlight Visual term=NONE cterm=NONE ctermbg=238 ctermfg=230 gui=NONE guibg=#444444 guifg=#f6f3e8
    highlight VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    highlight WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=Red
    highlight WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    highlight Folded term=NONE cterm=NONE ctermbg=59 ctermfg=145 gui=NONE guibg=#384048 guifg=#a0a8b0
    highlight projectFlagsEntry term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight CSApproxTest term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=fg guisp=Red
    highlight lCursor term=NONE cterm=NONE ctermbg=fg ctermfg=bg gui=NONE guibg=fg guifg=bg
    highlight MatchParen term=bold cterm=bold ctermbg=101 ctermfg=230 gui=bold guibg=#857b6f guifg=#f6f3e8
    highlight Comment term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#99968b
    highlight Constant term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e5786d
    highlight Special term=NONE cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#e7f6da
    highlight Identifier term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#cae682
    highlight Statement term=NONE cterm=NONE ctermbg=bg ctermfg=117 gui=NONE guibg=bg guifg=#8ac6f2
    highlight PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=173 gui=NONE guibg=bg guifg=#e5786d
    highlight Type term=NONE cterm=NONE ctermbg=bg ctermfg=186 gui=NONE guibg=bg guifg=#cae682
    highlight projectFilterEntry term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    highlight DiffAdd term=NONE cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=DarkBlue guifg=fg
    highlight DiffChange term=NONE cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    highlight DiffDelete term=bold cterm=bold ctermbg=30 ctermfg=21 gui=bold guibg=DarkCyan guifg=Blue
    highlight DiffText term=bold cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=Red guifg=fg
    highlight SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=Grey guifg=Cyan
    highlight SpellBad term=undercurl cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=Red
    highlight SpellCap term=undercurl cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=Blue
    highlight SpellRare term=undercurl cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    highlight Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    highlight SpellLocal term=undercurl cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=Cyan
elseif has("gui_running") || &t_Co == 88
    highlight Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#242424 guifg=#f6f3e8
    highlight Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=bg gui=NONE guibg=bg guifg=bg
    highlight Error term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    highlight Todo term=NONE cterm=NONE ctermbg=76 ctermfg=83 gui=NONE guibg=Yellow guifg=#8f8f8f
    highlight String term=NONE cterm=NONE ctermbg=bg ctermfg=41 gui=NONE guibg=bg guifg=#95e454
    highlight Number term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#e5786d
    highlight Function term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#cae682
    highlight SpecialKey term=NONE cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#343434 guifg=#808080
    highlight NonText term=NONE cterm=NONE ctermbg=16 ctermfg=83 gui=NONE guibg=#303030 guifg=#808080
    highlight Directory term=NONE cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=Cyan
    highlight ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=Red guifg=White
    highlight IncSearch term=NONE cterm=NONE ctermbg=fg ctermfg=bg gui=NONE guibg=bg guifg=fg
    highlight Search term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    highlight MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=SeaGreen
    highlight ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    highlight LineNr term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#000000 guifg=#857b6f
    highlight projectDescriptionDir term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight projectCD term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight Pmenu term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#444444 guifg=#f6f3e8
    highlight PmenuSel term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#cae682 guifg=#000000
    highlight PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=Grey guifg=fg
    highlight PmenuThumb term=NONE cterm=NONE ctermbg=fg ctermfg=bg gui=NONE guibg=bg guifg=fg
    highlight TabLine term=underline cterm=underline ctermbg=84 ctermfg=fg gui=underline guibg=DarkGrey guifg=fg
    highlight TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    highlight TabLineFill term=NONE cterm=NONE ctermbg=fg ctermfg=bg gui=NONE guibg=bg guifg=fg
    highlight CursorColumn term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    highlight CursorLine term=NONE cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#2d2d2d guifg=fg
    highlight Cursor term=NONE cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#656565 guifg=fg
    highlight Keyword term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#8ac6f2
    highlight Question term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=Green
    highlight StatusLine term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#444444 guifg=#f6f3e8
    highlight StatusLineNC term=NONE cterm=NONE ctermbg=16 ctermfg=37 gui=NONE guibg=#444444 guifg=#857b6f
    highlight VertSplit term=NONE cterm=NONE ctermbg=16 ctermfg=16 gui=NONE guibg=#444444 guifg=#444444
    highlight Title term=bold cterm=bold ctermbg=bg ctermfg=79 gui=bold guibg=bg guifg=#f6f3e8
    highlight Visual term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#444444 guifg=#f6f3e8
    highlight VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    highlight WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=Red
    highlight WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=Yellow guifg=Black
    highlight Folded term=NONE cterm=NONE ctermbg=17 ctermfg=38 gui=NONE guibg=#384048 guifg=#a0a8b0
    highlight projectFlagsEntry term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight CSApproxTest term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight lCursor term=NONE cterm=NONE ctermbg=fg ctermfg=bg gui=NONE guibg=fg guifg=bg
    highlight MatchParen term=bold cterm=bold ctermbg=37 ctermfg=79 gui=bold guibg=#857b6f guifg=#f6f3e8
    highlight Comment term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#99968b
    highlight Constant term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#e5786d
    highlight Special term=NONE cterm=NONE ctermbg=bg ctermfg=78 gui=NONE guibg=bg guifg=#e7f6da
    highlight Identifier term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#cae682
    highlight Statement term=NONE cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#8ac6f2
    highlight PreProc term=NONE cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#e5786d
    highlight Type term=NONE cterm=NONE ctermbg=bg ctermfg=57 gui=NONE guibg=bg guifg=#cae682
    highlight projectFilterEntry term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=NONE guibg=bg guifg=fg
    highlight FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=Grey guifg=Cyan
    highlight DiffAdd term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=DarkBlue guifg=fg
    highlight DiffChange term=NONE cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=DarkMagenta guifg=fg
    highlight DiffDelete term=bold cterm=bold ctermbg=21 ctermfg=19 gui=bold guibg=DarkCyan guifg=Blue
    highlight DiffText term=bold cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=Red guifg=fg
    highlight SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=Grey guifg=Cyan
    highlight SpellBad term=undercurl cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=Red
    highlight SpellCap term=undercurl cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=Blue
    highlight SpellRare term=undercurl cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=Magenta
    highlight Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    highlight SpellLocal term=undercurl cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=Cyan
endif
