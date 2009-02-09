call NERDSnippetsReset()
 
source ~/.vim/snippets/support_functions.vim
 
 
call NERDSnippetsFromDirectory("~/.vim/snippets")
 
function! s:inRailsEnv()
    return filereadable(getcwd() . '/config/environment.rb')
endfunction

function! s:inZendEnv()
    return filereadable(getcwd() . '/application/config/application.ini')
endfunction
 
if s:inRailsEnv()
    call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/ruby-rails', 'ruby')
    call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/eruby-rails', 'eruby')
endif
 
if s:inZendEnv()
    call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/zend', 'php')
endif
 
call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/html', 'eruby')
call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/html', 'xhtml')
call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/html', 'php')

call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/objc', 'objcpp')
