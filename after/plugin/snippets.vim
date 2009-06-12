call NERDSnippetsReset()

if has("win32")         " platform dependent
  source $VIMFILES\snippets\support_functions.vim
  let s:slash = '\'
else
  source $VIMFILES/snippets/support_functions.vim
  let s:slash = '/'
endif
 
let snippets = $VIMFILES . s:slash . 'snippets'
let snippets_ = snippets . s:slash
" snippets = '~/.vim/nerdsnippets'

call NERDSnippetsFromDirectory(snippets)
 
function! s:inRailsEnv()
    return filereadable(getcwd() . s:slash . 'config' . s:slash . 'environment.rb')
endfunction

function! s:inZendEnv()
    return filereadable(getcwd() . s:slash . 'application' . s:slash . 'config' . s:slash .  'application.ini')
endfunction
 
function! s:inCakeEnv()
    return filereadable(getcwd() . s:slash . 'cake' . s:slash . 'bootstrap.php')
endfunction
 
if s:inRailsEnv()
    call NERDSnippetsFromDirectoryForFiletype(snippets_.'ruby-rails', 'ruby')
    call NERDSnippetsFromDirectoryForFiletype(snippets_.'eruby-rails', 'eruby')
endif
 
if s:inZendEnv()
    call NERDSnippetsFromDirectoryForFiletype(snippets_.'zend', 'php')
endif
 
if s:inCakeEnv()
    call NERDSnippetsFromDirectoryForFiletype(snippets_.'cakephp', 'php')
    call NERDSnippetsFromDirectoryForFiletype(snippets_.'cakephtml', 'php')
endif

call NERDSnippetsFromDirectoryForFiletype(snippets_.'html', 'eruby')
call NERDSnippetsFromDirectoryForFiletype(snippets_.'html', 'xhtml')
call NERDSnippetsFromDirectoryForFiletype(snippets_.'html', 'php')

call NERDSnippetsFromDirectoryForFiletype(snippets_.'objc', 'objcpp')
call NERDSnippetsFromDirectoryForFiletype(snippets_.'c', 'objcpp')

call NERDSnippetsFromDirectoryForFiletype(snippets_.'c', 'objc')
