" ▶ snippet 代码块
" Use <C-l> for trigger snippet expand.
" 触发插件
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
" 选择text
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:UltiSnipsExpandTrigger = "<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-o>"
let g:UltiSnipsJumpBackwardTrigger="<s-o>"

" " 使用 tab 切换下一个触发点，shit+tab 上一个触发点
" " 使用 UltiSnipsEdit 命令时垂直分割屏幕
" let g:UltiSnipsEditSplit="vertical"
" △ snippet 代码块
