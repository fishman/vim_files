call SnipMateReset()

let g:snips_author="Reza Jelveh"

source ~/.vim/snippets/support_functions.vim
 
 
call SnipMateExtractSnippets("~/.vim/snippets")
 
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
    call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/ruby-rails', 'ruby')
    call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/eruby-rails', 'eruby')
endif
 
if s:inZendEnv()
    call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/zend', 'php')
endif
 
if s:inCakeEnv()
    call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/cakephp', 'php')
    call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/cakephtml', 'php')
endif

call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/html', 'eruby')
call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/html', 'xhtml')
call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/html', 'php')

call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/objc', 'objcpp')
call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/c', 'objcpp')

call SnipMateExtractSnippetsForFiletype('~/.vim/snippets/c', 'objc')
