au! BufRead,BufNewFile *.m       setfiletype objc
au! BufRead,BufNewFile *.mm      setfiletype objcpp
au! BufRead,BufNewFile *.mkd     setfiletype mkd
au! FileType objc,objcpp set et sw=4 sts=4 ai
au! FileType objc,objcpp set makeprg=xcodebuild\ -configuration\ Debug
