" projtags.vim
" Brief: Set tags file for per project
" Version: 0.2
" Date: Apr.25, 2007
" Author: Yuxuan 'fishy' Wang <fishywang@gmail.com>
"
" Installation: put this file under your ~/.vim/plugins/
"
" Usage:
"
" Set your projects path into g:ProjTags as a list, for example:
"
" let g:ProjTags = [ "~/work/proj1" ]
" 
" In this case for all file match the pattern "~/work/proj1/*", the tag file
" "~/work/proj1/tags" will be used.
"
" You can also specify a tags file other than the default one or more tags
" files for one directory by a list:
"
" let g:ProjTags += [[ "~/work/proj2", "~/work/proj2/tags",
" "~/work/common.tags" ]]
" 
" In this case for all file match the pattern "~/work/proj2/*", the tag files
" "~/work/proj2.tags" and "~/work/common.tags" will be used.
"
" You can add the above codes into your vimrc file
"
" Revisions:
"
" 0.2, Apr.25, 2007:
"  + more tags file for one directory support (contributed by Joseph Barker)
"  + check for g:ProjTags before use it
"
" 0.1, Apr.24, 2007:
"  * initial version
"

function! SetProjTags()
	if exists("g:ProjTags")
		for item in g:ProjTags
			try
				let [filepattern; tagfiles] = item
				let filepattern .= "/*"
			catch /.*List.*/ " item is not a list
				let filepattern = item . "/*"
				let tagfiles = [item . "/tags"]
			endtry
			for tagfile in tagfiles
				execute 'autocmd BufEnter ' . filepattern . ' :setlocal tags+=' . tagfile 
			endfor
			unlet item
		endfor
	endif
endfunc

call SetProjTags()

