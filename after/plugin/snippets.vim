call SnipMateReset()

let g:snipmate_snippets_dir="~/.vim/snipmate-snippets"
let g:snips_author="Reza Jelveh"

source ~/.vim/snipmate-snippets/support_functions.vim
 
 
call SnipMateExtractSnippets("~/.vim/snipmate-snippets")
 
function! s:inRailsEnv()
    return filereadable(getcwd() . '/config/environment.rb')
endfunction

function! s:inZendEnv()
    return filereadable(getcwd() . '/application/config/application.ini')
endfunction
 
function! s:inCakeEnv()
    return filereadable(getcwd() . '/cake/bootstrap.php')
endfunction
 
if s:inRailsEnv()
    call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/ruby-rails', 'ruby')
    call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/eruby-rails', 'eruby')
endif
 
if s:inZendEnv()
    call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/zend', 'php')
endif
 
if s:inCakeEnv()
    call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/cakephp', 'php')
    call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/cakephtml', 'php')
endif

call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/html', 'eruby')
call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/html', 'xhtml')
call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/html', 'php')

call SnipMateExtractSnippetsForFiletype('~/.vim/snipmate-snippets/objc', 'objcpp')
