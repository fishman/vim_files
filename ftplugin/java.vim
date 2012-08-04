setlocal completeopt=menuone,longest
setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal omnifunc=javacomplete#Complete completefunc=javacomplete#CompleteParamsInfo
set cinoptions+=j1


" ECLIM stuff
nnoremap <silent> <buffer> <leader>p :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
nnoremap <silent> <leader>jv :Validate<cr>
nnoremap <silent> <leader>jc :JavaCorrect<cr>

" highlighting stuff
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

" optional
let java_mark_braces_in_parens_as_errors=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_minlines = 150

if glob('AndroidManifest.xml') =~ ''
  if filereadable('project.properties') 
    let s:androidSdkPath = '/opt/android-sdk'
    " the following line uses external tools and is less portable
    "let s:androidTargetPlatform = system('grep target= project.properties | cut -d \= -f 2')
    vimgrep /target=/j project.properties
    let s:androidTargetPlatform = split(getqflist()[0].text, '=')[1] 
    let s:targetAndroidJar = s:androidSdkPath . '/platforms/' . s:androidTargetPlatform . '/android.jar'
    if $CLASSPATH =~ ''
      let $CLASSPATH = s:targetAndroidJar . ':' . $CLASSPATH
    else
      let $CLASSPATH = s:targetAndroidJar
    endif
  end
endif
