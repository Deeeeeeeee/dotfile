" Open request results in a horizontal split
let g:result_split_horizontal = 1
" Keep the http file buffer above|left when split horizontal|vertical
let g:result_split_in_place = 1
" Skip SSL verification, useful for unknown certificates
let g:skip_ssl_verification = 0
" Encode URL before making request
let g:encode_url = 1
" Highlight request on run
let g:highlight = {"enabled":1, "timeout": 150}

let g:result = {
            \ "show_url": 1,
            \ "show_http_info": 1,
            \ "show_headers": 0,
            \ "formatters": {
            \   "json": "jq",
            \ }
            \ }

" Jump to request line on run
let g:jump_to_request = 0
let g:env_file = '.env'
"custom_dynamic_variables = {},
let g:yank_dry_run = 1

nmap <leader>t <Plug>RestNvim

" result = {
"   -- toggle showing URL, HTTP info, headers at top the of result window
"   show_url = true,
"   show_http_info = true,
"   show_headers = true,
"   -- executables or functions for formatting response body [optional]
"   -- set them to false if you want to disable them
"   formatters = {
"     json = "jq",
"     html = function(body)
"       return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
"     end
"   },
" },
