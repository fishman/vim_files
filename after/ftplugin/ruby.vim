set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

command! -bar -nargs=0 Irb :silent exe "!screen -S irb -X stuff " . shellescape(getline(".")) . "\015" | silent redraw!

setl nu cindent cino=J1

nmap <silent> <Leader>r :R<CR>
nmap <silent> <Leader>rs :RS<CR>
nmap <silent> <Leader>a :A<CR>
nmap <silent> <Leader>av :AV<CR>
nmap <silent> <Leader>as :AS<CR>
nmap <silent> <Leader>rt :Rtags<CR><CR>
nmap <silent> <Leader>rm :Rmodel<cr>
nmap <silent> <Leader>rc :Rcontroller<cr>
nmap <silent> <Leader>rv :Rview<cr>
nmap <silent> <Leader>rf :Rfixtures<cr>
nmap <silent> <Leader>rl :Rlayout<cr>
nmap <silent> <Leader>rp :Rpreview<cr><cr>

autocmd User Rails    silent! Rlcd
autocmd User Rails    map <buffer> <F9> :Rake<CR>
autocmd User Rails    map <buffer> <F8> :Rserver!thin<CR><CR>
autocmd User Rails    map <F7> :R<CR>
