" Vim syntax file
" Language:	C++ special highlighting for WinAPI
" Maintainer:	Reza Jelveh
" Last Change:	2008 November 24

syn keyword cppWINAPI	SetWindowLong GetWindowLong DefWindowProc LoadIcon 
syn keyword cppWINAPI	GetParent GetDlgItem SendDlgItemMessage SendMessage
syn keyword cppWINAPI GetWindowRect SetWindowPos
syn keyword cppWINAPI RegisterClass RegisterClassEx

syn keyword cppWINAPIConst WM_CREATE WM_DESTROY WM_SIZE
syn keyword cppWINAPIConst CS_HREDRAW CS_VREDRAW
syn keyword cppWINAPIConst COLOR_BTNFACE

syn keyword cppWINAPItype	HGLOBAL BYTE HRSCR DWORD HBRUSH HWND UINT WPARAM LPARAM
syn keyword cppWINAPItype	WINAPI LRESULT CALLBACK WNDCLASS ATOM HICON HRSRC
syn keyword cppWINAPItype	HINSTANCE BOOL

" Default highlighting
hi def link cppWINAPI				Identifier
hi def link cppWINAPItype         Type
hi def link cppWINAPIConst    Constant

