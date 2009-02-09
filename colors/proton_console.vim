" This scheme was created by CSApproxSnapshot
" on Sat, 17 Jan 2009

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = 'proton_console'

if 0
elseif has("gui_running") || &t_Co == 256
    highlight Normal term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    highlight Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=231 gui=NONE guibg=bg guifg=#ffffff
    highlight Error term=reverse cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#cc2525 guifg=#ffffff
    highlight Todo term=NONE cterm=NONE ctermbg=120 ctermfg=28 gui=NONE guibg=#99ff99 guifg=#008000
    highlight String term=NONE cterm=NONE ctermbg=bg ctermfg=60 gui=NONE guibg=bg guifg=#4a6f8b
    highlight Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=160 gui=NONE guibg=bg guifg=#cc0000
    highlight SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=20 gui=NONE guibg=bg guifg=#0000d4
    highlight NonText term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#0000d4
    highlight Directory term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#1600ff
    highlight ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ed2b2b guifg=#ffffff
    highlight IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    highlight Search term=reverse cterm=NONE ctermbg=123 ctermfg=fg gui=NONE guibg=#98f5ff guifg=fg
    highlight MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#2e8b57
    highlight ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    highlight LineNr term=underline cterm=NONE ctermbg=254 ctermfg=102 gui=NONE guibg=#e6e6e6 guifg=#888888
    highlight Pmenu term=NONE cterm=NONE ctermbg=189 ctermfg=fg gui=NONE guibg=#cae1ff guifg=fg
    highlight PmenuSel term=NONE cterm=NONE ctermbg=60 ctermfg=231 gui=NONE guibg=#4a6f8b guifg=#ffffff
    highlight PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    highlight PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    highlight TabLine term=underline cterm=underline ctermbg=253 ctermfg=fg gui=underline guibg=#dfdfdf guifg=fg
    highlight TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    highlight TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=231 gui=reverse guibg=bg guifg=fg
    highlight CursorColumn term=reverse cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#f1f5fa guifg=fg
    highlight CursorLine term=underline cterm=NONE ctermbg=231 ctermfg=fg gui=NONE guibg=#f1f5fa guifg=fg
    highlight Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    highlight Question term=NONE cterm=bold ctermbg=bg ctermfg=64 gui=bold guibg=bg guifg=#458b00
    highlight StatusLine term=reverse,bold cterm=NONE ctermbg=23 ctermfg=231 gui=NONE guibg=#2e4e4e guifg=#ffffff
    highlight StatusLineNC term=reverse cterm=NONE ctermbg=254 ctermfg=66 gui=NONE guibg=#e4e4e4 guifg=#6f808f
    highlight VertSplit term=reverse cterm=NONE ctermbg=254 ctermfg=23 gui=NONE guibg=#e4e4e4 guifg=#2e4e4e
    highlight Title term=bold cterm=bold ctermbg=bg ctermfg=32 gui=bold guibg=bg guifg=#0099cc
    highlight Visual term=reverse cterm=NONE ctermbg=153 ctermfg=fg gui=NONE guibg=#bcd4fd guifg=fg
    highlight VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    highlight WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ed2b2b
    highlight WildMenu term=NONE cterm=NONE ctermbg=116 ctermfg=16 gui=NONE guibg=#86cdeb guifg=#000000
    highlight Folded term=NONE cterm=NONE ctermbg=254 ctermfg=18 gui=NONE guibg=#e6e6e6 guifg=#000080
    highlight lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    highlight MatchParen term=reverse cterm=NONE ctermbg=141 ctermfg=231 gui=NONE guibg=#ab81ff guifg=#ffffff
    highlight Comment term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=italic guibg=bg guifg=#0000ed
    highlight Constant term=underline cterm=NONE ctermbg=bg ctermfg=208 gui=NONE guibg=bg guifg=#ff8b00
    highlight Special term=bold cterm=NONE ctermbg=bg ctermfg=92 gui=NONE guibg=bg guifg=#8a2ae2
    highlight Identifier term=underline cterm=NONE ctermbg=bg ctermfg=65 gui=NONE guibg=bg guifg=#458b73
    highlight Statement term=bold cterm=bold ctermbg=bg ctermfg=125 gui=bold guibg=bg guifg=#b02f60
    highlight PreProc term=underline cterm=NONE ctermbg=bg ctermfg=26 gui=NONE guibg=bg guifg=#1773cc
    highlight Type term=underline cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#008b00
    highlight CursorIM term=NONE cterm=NONE ctermbg=16 ctermfg=231 gui=NONE guibg=#000000 guifg=#ffffff
    highlight FoldColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=#bfbfbf guifg=#000080
    highlight DiffAdd term=bold cterm=NONE ctermbg=71 ctermfg=fg gui=NONE guibg=#3cb370 guifg=fg
    highlight DiffChange term=bold cterm=NONE ctermbg=39 ctermfg=fg gui=NONE guibg=#00beff guifg=fg
    highlight DiffDelete term=bold cterm=bold ctermbg=62 ctermfg=16 gui=bold guibg=#6a59cc guifg=#000000
    highlight DiffText term=reverse cterm=NONE ctermbg=220 ctermfg=fg gui=NONE guibg=#ffd600 guifg=fg
    highlight SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=18 gui=NONE guibg=#bfbfbf guifg=#000080
    highlight SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ed2b2b
    highlight SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=20 gui=undercurl guibg=bg guifg=fg guisp=#0000d4
    highlight SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=198 gui=undercurl guibg=bg guifg=fg guisp=#f10883
    highlight Underlined term=underline cterm=underline ctermbg=bg ctermfg=75 gui=underline guibg=bg guifg=#62b8ff
    highlight SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=30 gui=undercurl guibg=bg guifg=fg guisp=#008080
elseif has("gui_running") || &t_Co == 88
    highlight Normal term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    highlight Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=79 gui=NONE guibg=bg guifg=#ffffff
    highlight Error term=reverse cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#cc2525 guifg=#ffffff
    highlight Todo term=NONE cterm=NONE ctermbg=45 ctermfg=20 gui=NONE guibg=#99ff99 guifg=#008000
    highlight String term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#4a6f8b
    highlight Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=48 gui=NONE guibg=bg guifg=#cc0000
    highlight SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=18 gui=NONE guibg=bg guifg=#0000d4
    highlight NonText term=bold cterm=bold ctermbg=bg ctermfg=18 gui=bold guibg=bg guifg=#0000d4
    highlight Directory term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=NONE guibg=bg guifg=#1600ff
    highlight ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ed2b2b guifg=#ffffff
    highlight IncSearch term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    highlight Search term=reverse cterm=NONE ctermbg=47 ctermfg=fg gui=NONE guibg=#98f5ff guifg=fg
    highlight MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#2e8b57
    highlight ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    highlight LineNr term=underline cterm=NONE ctermbg=87 ctermfg=83 gui=NONE guibg=#e6e6e6 guifg=#888888
    highlight Pmenu term=NONE cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#cae1ff guifg=fg
    highlight PmenuSel term=NONE cterm=NONE ctermbg=37 ctermfg=79 gui=NONE guibg=#4a6f8b guifg=#ffffff
    highlight PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    highlight PmenuThumb term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    highlight TabLine term=underline cterm=underline ctermbg=87 ctermfg=fg gui=underline guibg=#dfdfdf guifg=fg
    highlight TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    highlight TabLineFill term=reverse cterm=NONE ctermbg=16 ctermfg=79 gui=reverse guibg=bg guifg=fg
    highlight CursorColumn term=reverse cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#f1f5fa guifg=fg
    highlight CursorLine term=underline cterm=NONE ctermbg=79 ctermfg=fg gui=NONE guibg=#f1f5fa guifg=fg
    highlight Cursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    highlight Question term=NONE cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#458b00
    highlight StatusLine term=reverse,bold cterm=NONE ctermbg=21 ctermfg=79 gui=NONE guibg=#2e4e4e guifg=#ffffff
    highlight StatusLineNC term=reverse cterm=NONE ctermbg=87 ctermfg=37 gui=NONE guibg=#e4e4e4 guifg=#6f808f
    highlight VertSplit term=reverse cterm=NONE ctermbg=87 ctermfg=21 gui=NONE guibg=#e4e4e4 guifg=#2e4e4e
    highlight Title term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=#0099cc
    highlight Visual term=reverse cterm=NONE ctermbg=59 ctermfg=fg gui=NONE guibg=#bcd4fd guifg=fg
    highlight VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    highlight WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ed2b2b
    highlight WildMenu term=NONE cterm=NONE ctermbg=43 ctermfg=16 gui=NONE guibg=#86cdeb guifg=#000000
    highlight Folded term=NONE cterm=NONE ctermbg=87 ctermfg=17 gui=NONE guibg=#e6e6e6 guifg=#000080
    highlight lCursor term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    highlight MatchParen term=reverse cterm=NONE ctermbg=39 ctermfg=79 gui=NONE guibg=#ab81ff guifg=#ffffff
    highlight Comment term=bold cterm=NONE ctermbg=bg ctermfg=19 gui=italic guibg=bg guifg=#0000ed
    highlight Constant term=underline cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ff8b00
    highlight Special term=bold cterm=NONE ctermbg=bg ctermfg=34 gui=NONE guibg=bg guifg=#8a2ae2
    highlight Identifier term=underline cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#458b73
    highlight Statement term=bold cterm=bold ctermbg=bg ctermfg=49 gui=bold guibg=bg guifg=#b02f60
    highlight PreProc term=underline cterm=NONE ctermbg=bg ctermfg=22 gui=NONE guibg=bg guifg=#1773cc
    highlight Type term=underline cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#008b00
    highlight CursorIM term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#000000 guifg=#ffffff
    highlight FoldColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=#bfbfbf guifg=#000080
    highlight DiffAdd term=bold cterm=NONE ctermbg=25 ctermfg=fg gui=NONE guibg=#3cb370 guifg=fg
    highlight DiffChange term=bold cterm=NONE ctermbg=27 ctermfg=fg gui=NONE guibg=#00beff guifg=fg
    highlight DiffDelete term=bold cterm=bold ctermbg=38 ctermfg=16 gui=bold guibg=#6a59cc guifg=#000000
    highlight DiffText term=reverse cterm=NONE ctermbg=72 ctermfg=fg gui=NONE guibg=#ffd600 guifg=fg
    highlight SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=17 gui=NONE guibg=#bfbfbf guifg=#000080
    highlight SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ed2b2b
    highlight SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=18 gui=undercurl guibg=bg guifg=fg guisp=#0000d4
    highlight SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=65 gui=undercurl guibg=bg guifg=fg guisp=#f10883
    highlight Underlined term=underline cterm=underline ctermbg=bg ctermfg=43 gui=underline guibg=bg guifg=#62b8ff
    highlight SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#008080
endif
