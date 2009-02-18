source ~/.vim/snipmate-snippets/support_functions.vim
 
 
call SnipMateExtractSnippetsFromDir("~/.vim/snipmate-snippets")
 
function! s:inRailsEnv()
    return filereadable(getcwd() . '/config/environment.rb')
endfunction

function! s:inZendEnv()
    return filereadable(getcwd() . '/application/config/application.ini')
endfunction
 
if s:inRailsEnv()
    call SnipMateExtractSnippetsFromDirForFiletype('~/.vim/snipmate-snippets/ruby-rails', 'ruby')
    call SnipMateExtractSnippetsFromDirForFiletype('~/.vim/snipmate-snippets/eruby-rails', 'eruby')
endif
 
if s:inZendEnv()
    call SnipMateExtractSnippetsFromDirForFiletype('~/.vim/snipmate-snippets/zend', 'php')
endif
 
call SnipMateExtractSnippetsFromDirForFiletype('~/.vim/snipmate-snippets/html', 'eruby')
call SnipMateExtractSnippetsFromDirForFiletype('~/.vim/snipmate-snippets/html', 'xhtml')
call SnipMateExtractSnippetsFromDirForFiletype('~/.vim/snipmate-snippets/html', 'php')

call SnipMateExtractSnippetsFromDirForFiletype('~/.vim/snipmate-snippets/objc', 'objcpp')
