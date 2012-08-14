command! -nargs=+ Ack call AckFunc(<q-args>)
function! AckFunc(query)
  let cmd = 'ack -H --nocolor --nogroup --column --type-set coffee=.coffee,.eco '
  let cmd .= a:query
  let efm = "%f:%l:%c:%m"
  let title = "[Found: %s] Ack"
  let env = asynchandler#quickfix(efm, title)
  call asynccommand#run(cmd, env)
endfunction
