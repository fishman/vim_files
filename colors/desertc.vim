" This scheme was created by CSApproxSnapshot
" on Mon, 26 Jan 2009

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = 'desertc'
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = 'desertc'
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || &term =~? "^konsole"
    CSAHi Normal term=NONE cterm=NONE ctermbg=59 ctermfg=231 gui=NONE guibg=#333333 guifg=#ffffff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=102 gui=NONE guibg=bg guifg=#666666
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=202 gui=NONE guibg=#eded00 guifg=#ff4500
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=149 gui=NONE guibg=bg guifg=#99cc32
    CSAHi NonText term=bold cterm=bold ctermbg=239 ctermfg=147 gui=bold guibg=#4d4d4d guifg=#a0a0ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#01abe9
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=109 ctermfg=229 gui=reverse guibg=#f0e68b guifg=#6f808f
    CSAHi Search term=reverse cterm=NONE ctermbg=179 ctermfg=224 gui=NONE guibg=#cc853f guifg=#f5deb3
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=179 gui=bold guibg=bg guifg=#d9a520
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#fbf204
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=199 ctermfg=fg gui=NONE guibg=#f10883 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=244 ctermfg=fg gui=underline guibg=#808080 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=59 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=102 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=229 ctermfg=109 gui=NONE guibg=#f0e68b guifg=#6f808f
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=#00ff7e
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=187 ctermfg=244 gui=NONE guibg=#c2bfa5 guifg=#7e7e7e
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=187 ctermfg=244 gui=NONE guibg=#c2bfa5 guifg=#7e7e7e
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=174 gui=bold guibg=bg guifg=#cc5c5c
    CSAHi Visual term=reverse cterm=NONE ctermbg=107 ctermfg=229 gui=NONE guibg=#6a8e23 guifg=#f0e68b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=216 gui=NONE guibg=bg guifg=#fa8072
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#fbf204 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=220 gui=NONE guibg=#4d4d4d guifg=#ffd600
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=59 gui=NONE guibg=#ffffff guifg=#333333
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#008080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#86cdeb
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffdeac
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#98fa98
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=#f0e68b
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=174 gui=NONE guibg=bg guifg=#cc5c5c
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=186 gui=bold guibg=bg guifg=#bdb66a
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=187 gui=NONE guibg=#4d4d4d guifg=#d1b48b
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=20 gui=bold guibg=#008080 guifg=#0000d4
    CSAHi DiffText term=reverse cterm=bold ctermbg=160 ctermfg=fg gui=bold guibg=#dd0805 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=39 gui=NONE guibg=#bfbfbf guifg=#01abe9
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=160 gui=undercurl guibg=bg guifg=fg guisp=#dd0805
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=20 gui=undercurl guibg=bg guifg=fg guisp=#0000d4
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=199 gui=undercurl guibg=bg guifg=fg guisp=#f10883
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=39 gui=undercurl guibg=bg guifg=fg guisp=#01abe9
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=236 ctermfg=255 gui=NONE guibg=#333333 guifg=#ffffff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#666666
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=208 gui=NONE guibg=#eded00 guifg=#ff4500
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=191 gui=NONE guibg=bg guifg=#99cc32
    CSAHi NonText term=bold cterm=bold ctermbg=239 ctermfg=189 gui=bold guibg=#4d4d4d guifg=#a0a0ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#01abe9
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=145 ctermfg=229 gui=reverse guibg=#f0e68b guifg=#6f808f
    CSAHi Search term=reverse cterm=NONE ctermbg=215 ctermfg=230 gui=NONE guibg=#cc853f guifg=#f5deb3
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=72 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=221 gui=bold guibg=bg guifg=#d9a520
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#fbf204
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=199 ctermfg=fg gui=NONE guibg=#f10883 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=236 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=244 ctermfg=fg gui=underline guibg=#808080 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=255 ctermfg=236 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=229 ctermfg=145 gui=NONE guibg=#f0e68b guifg=#6f808f
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=49 gui=bold guibg=bg guifg=#00ff7e
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=224 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=224 ctermfg=145 gui=NONE guibg=#c2bfa5 guifg=#7e7e7e
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=224 ctermfg=145 gui=NONE guibg=#c2bfa5 guifg=#7e7e7e
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=210 gui=bold guibg=bg guifg=#cc5c5c
    CSAHi Visual term=reverse cterm=NONE ctermbg=107 ctermfg=229 gui=NONE guibg=#6a8e23 guifg=#f0e68b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#fa8072
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#fbf204 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=226 gui=NONE guibg=#4d4d4d guifg=#ffd600
    CSAHi lCursor term=NONE cterm=NONE ctermbg=255 ctermfg=236 gui=NONE guibg=#ffffff guifg=#333333
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=37 ctermfg=fg gui=NONE guibg=#008080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=159 gui=NONE guibg=bg guifg=#86cdeb
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=230 gui=NONE guibg=bg guifg=#ffdeac
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=194 gui=NONE guibg=bg guifg=#98fa98
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=229 gui=bold guibg=bg guifg=#f0e68b
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=210 gui=NONE guibg=bg guifg=#cc5c5c
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=186 gui=bold guibg=bg guifg=#bdb66a
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=223 gui=NONE guibg=#4d4d4d guifg=#d1b48b
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=127 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=37 ctermfg=21 gui=bold guibg=#008080 guifg=#0000d4
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#dd0805 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=45 gui=NONE guibg=#bfbfbf guifg=#01abe9
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#dd0805
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000d4
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=199 gui=undercurl guibg=bg guifg=fg guisp=#f10883
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=45 gui=undercurl guibg=bg guifg=fg guisp=#01abe9
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=236 ctermfg=231 gui=NONE guibg=#333333 guifg=#ffffff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=241 gui=NONE guibg=bg guifg=#666666
    CSAHi Error term=reverse cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=202 gui=NONE guibg=#eded00 guifg=#ff4500
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=113 gui=NONE guibg=bg guifg=#99cc32
    CSAHi NonText term=bold cterm=bold ctermbg=239 ctermfg=147 gui=bold guibg=#4d4d4d guifg=#a0a0ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=38 gui=NONE guibg=bg guifg=#01abe9
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=160 ctermfg=231 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=66 ctermfg=222 gui=reverse guibg=#f0e68b guifg=#6f808f
    CSAHi Search term=reverse cterm=NONE ctermbg=173 ctermfg=223 gui=NONE guibg=#cc853f guifg=#f5deb3
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=178 gui=bold guibg=bg guifg=#d9a520
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#fbf204
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=198 ctermfg=fg gui=NONE guibg=#f10883 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=244 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=236 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=244 ctermfg=fg gui=underline guibg=#808080 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=231 ctermfg=236 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=241 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=222 ctermfg=66 gui=NONE guibg=#f0e68b guifg=#6f808f
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=48 gui=bold guibg=bg guifg=#00ff7e
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=145 ctermfg=244 gui=NONE guibg=#c2bfa5 guifg=#7e7e7e
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=145 ctermfg=244 gui=NONE guibg=#c2bfa5 guifg=#7e7e7e
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=167 gui=bold guibg=bg guifg=#cc5c5c
    CSAHi Visual term=reverse cterm=NONE ctermbg=64 ctermfg=222 gui=NONE guibg=#6a8e23 guifg=#f0e68b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=209 gui=NONE guibg=bg guifg=#fa8072
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=226 ctermfg=16 gui=NONE guibg=#fbf204 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=239 ctermfg=220 gui=NONE guibg=#4d4d4d guifg=#ffd600
    CSAHi lCursor term=NONE cterm=NONE ctermbg=231 ctermfg=236 gui=NONE guibg=#ffffff guifg=#333333
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=30 ctermfg=fg gui=NONE guibg=#008080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=116 gui=NONE guibg=bg guifg=#86cdeb
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=223 gui=NONE guibg=bg guifg=#ffdeac
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#98fa98
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=222 gui=bold guibg=bg guifg=#f0e68b
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=167 gui=NONE guibg=bg guifg=#cc5c5c
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=143 gui=bold guibg=bg guifg=#bdb66a
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=239 ctermfg=180 gui=NONE guibg=#4d4d4d guifg=#d1b48b
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=90 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=30 ctermfg=20 gui=bold guibg=#008080 guifg=#0000d4
    CSAHi DiffText term=reverse cterm=bold ctermbg=160 ctermfg=fg gui=bold guibg=#dd0805 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=38 gui=NONE guibg=#bfbfbf guifg=#01abe9
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=160 gui=undercurl guibg=bg guifg=fg guisp=#dd0805
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=20 gui=undercurl guibg=bg guifg=fg guisp=#0000d4
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=198 gui=undercurl guibg=bg guifg=fg guisp=#f10883
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=38 gui=undercurl guibg=bg guifg=fg guisp=#01abe9
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=79 gui=NONE guibg=#333333 guifg=#ffffff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=81 gui=NONE guibg=bg guifg=#666666
    CSAHi Error term=reverse cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=64 gui=NONE guibg=#eded00 guifg=#ff4500
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=40 gui=NONE guibg=bg guifg=#99cc32
    CSAHi NonText term=bold cterm=bold ctermbg=81 ctermfg=39 gui=bold guibg=#4d4d4d guifg=#a0a0ff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=23 gui=NONE guibg=bg guifg=#01abe9
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=48 ctermfg=79 gui=NONE guibg=#dd0805 guifg=#ffffff
    CSAHi IncSearch term=reverse cterm=NONE ctermbg=37 ctermfg=73 gui=reverse guibg=#f0e68b guifg=#6f808f
    CSAHi Search term=reverse cterm=NONE ctermbg=52 ctermfg=74 gui=NONE guibg=#cc853f guifg=#f5deb3
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=21 gui=bold guibg=bg guifg=#2e8b57
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=52 gui=bold guibg=bg guifg=#d9a520
    CSAHi LineNr term=underline cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#fbf204
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=65 ctermfg=fg gui=NONE guibg=#f10883 guifg=fg
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=83 ctermfg=fg gui=NONE guibg=#808080 guifg=fg
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=85 ctermfg=fg gui=NONE guibg=#bfbfbf guifg=fg
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi TabLine term=underline cterm=underline ctermbg=83 ctermfg=fg gui=underline guibg=#808080 guifg=fg
    CSAHi TabLineSel term=bold cterm=bold ctermbg=bg ctermfg=fg gui=bold guibg=bg guifg=fg
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=79 ctermfg=16 gui=reverse guibg=bg guifg=fg
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi CursorLine term=underline cterm=NONE ctermbg=81 ctermfg=fg gui=NONE guibg=#666666 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=73 ctermfg=37 gui=NONE guibg=#f0e68b guifg=#6f808f
    CSAHi Question term=NONE cterm=bold ctermbg=bg ctermfg=29 gui=bold guibg=bg guifg=#00ff7e
    CSAHi StatusLine term=reverse,bold cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#c2bfa5 guifg=#000000
    CSAHi StatusLineNC term=reverse cterm=NONE ctermbg=57 ctermfg=82 gui=NONE guibg=#c2bfa5 guifg=#7e7e7e
    CSAHi VertSplit term=reverse cterm=NONE ctermbg=57 ctermfg=82 gui=NONE guibg=#c2bfa5 guifg=#7e7e7e
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=53 gui=bold guibg=bg guifg=#cc5c5c
    CSAHi Visual term=reverse cterm=NONE ctermbg=36 ctermfg=73 gui=NONE guibg=#6a8e23 guifg=#f0e68b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#fa8072
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#fbf204 guifg=#000000
    CSAHi Folded term=NONE cterm=NONE ctermbg=81 ctermfg=72 gui=NONE guibg=#4d4d4d guifg=#ffd600
    CSAHi lCursor term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#ffffff guifg=#333333
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=21 ctermfg=fg gui=NONE guibg=#008080 guifg=fg
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=43 gui=NONE guibg=bg guifg=#86cdeb
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=73 gui=NONE guibg=bg guifg=#ffdeac
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#98fa98
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=73 gui=bold guibg=bg guifg=#f0e68b
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=53 gui=NONE guibg=bg guifg=#cc5c5c
    CSAHi Type term=underline cterm=bold ctermbg=bg ctermfg=57 gui=bold guibg=bg guifg=#bdb66a
    CSAHi FoldColumn term=NONE cterm=NONE ctermbg=81 ctermfg=57 gui=NONE guibg=#4d4d4d guifg=#d1b48b
    CSAHi DiffAdd term=bold cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#000080 guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=33 ctermfg=fg gui=NONE guibg=#800080 guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=21 ctermfg=18 gui=bold guibg=#008080 guifg=#0000d4
    CSAHi DiffText term=reverse cterm=bold ctermbg=48 ctermfg=fg gui=bold guibg=#dd0805 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=23 gui=NONE guibg=#bfbfbf guifg=#01abe9
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=48 gui=undercurl guibg=bg guifg=fg guisp=#dd0805
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=18 gui=undercurl guibg=bg guifg=fg guisp=#0000d4
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=65 gui=undercurl guibg=bg guifg=fg guisp=#f10883
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=23 gui=undercurl guibg=bg guifg=fg guisp=#01abe9
endif

if 1
    delcommand CSAHi
endif
