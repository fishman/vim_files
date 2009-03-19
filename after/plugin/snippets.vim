call ResetSnippets()

let g:snips_author="Reza Jelveh"

source ~/.vim/snippets/support_functions.vim
 
call GetSnippets('~/.vim/snippets')
 
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
    call ExtractSnips('~/.vim/snippets/ruby-rails', 'ruby')
    call ExtractSnips('~/.vim/snippets/eruby-rails', 'eruby')
endif
 
if s:inZendEnv()
    call ExtractSnips('~/.vim/snippets/zend', 'php')
endif
 
if s:inCakeEnv()
    call ExtractSnips('~/.vim/snippets/cakephp', 'php')
    call ExtractSnips('~/.vim/snippets/cakephtml', 'php')
endif

call ExtractSnips('~/.vim/snippets/html', 'eruby')
call ExtractSnips('~/.vim/snippets/html', 'xhtml')
call ExtractSnips('~/.vim/snippets/html', 'php')

call ExtractSnips('~/.vim/snippets/objc', 'objcpp')
call ExtractSnips('~/.vim/snippets/c', 'objcpp')

call ExtractSnips('~/.vim/snippets/c', 'objc')
