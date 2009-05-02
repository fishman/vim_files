call NERDSnippetsReset()
 
" source ~/.vim/nerdsnippets/support_functions.vim
 
" snippets = '~/.vim/nerdsnippets'
let snippets = '~/.vim/snippets'
 
call NERDSnippetsFromDirectory(snippets)
 
function! s:inRailsEnv()
    return filereadable(getcwd() . 'config/environment.rb')
endfunction

function! s:inZendEnv()
    return filereadable(getcwd() . 'application/config/application.ini')
endfunction
 
function! s:inCakeEnv()
    return filereadable(getcwd() . 'cake/bootstrap.php')
endfunction
 
if s:inRailsEnv()
    call NERDSnippetsFromDirectoryForFiletype(snippets.'/ruby-rails', 'ruby')
    call NERDSnippetsFromDirectoryForFiletype(snippets.'/eruby-rails', 'eruby')
endif
 
if s:inZendEnv()
    call NERDSnippetsFromDirectoryForFiletype(snippets.'/zend', 'php')
endif
 
if s:inCakeEnv()
    call NERDSnippetsFromDirectoryForFiletype(snippets . '/cakephp', 'php')
    call NERDSnippetsFromDirectoryForFiletype(snippets . '/cakephtml', 'php')
endif

call NERDSnippetsFromDirectoryForFiletype(snippets.'/html', 'eruby')
call NERDSnippetsFromDirectoryForFiletype(snippets.'/html', 'xhtml')
call NERDSnippetsFromDirectoryForFiletype(snippets.'/html', 'php')

call NERDSnippetsFromDirectoryForFiletype(snippets.'/objc', 'objcpp')
call NERDSnippetsFromDirectoryForFiletype(snippets.'/c', 'objcpp')

call NERDSnippetsFromDirectoryForFiletype(snippets.'/c', 'objc')
