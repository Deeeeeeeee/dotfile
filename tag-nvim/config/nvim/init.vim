" ▶ 
" △ 

if filereadable(expand("~/.config/nvim/vimrc.plug"))
    source ~/.config/nvim/vimrc.plug
endif

" " diff 背景颜色
" if &diff
"     colorscheme gruvbox
" endif
" " 主题
" let g:gruvbox_italic=1 " 支持斜体
" colorscheme gruvbox

if &diff
    colorscheme material
endif
" 主题
let g:material_terminal_italics=1 " 支持斜体
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_theme_style = 'palenight'
colorscheme material

" coc调试
" let g:node_client_debug = 1

" universal-ctags
" https://docs.ctags.io/en/latest/autotools.html
" https://github.com/universal-ctags/ctags
"
" $ git clone https://github.com/universal-ctags/ctags.git
" $ cd ctags
" $ ./autogen.sh
" $ ./configure --prefix=/where/you/want # defaults to /usr/local
" $ make
" $ make install # may require extra privileges depending on where to install


" 配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" fileencode
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" 显示行号
set number
" 共享剪贴板
set clipboard=unnamedplus
" 设置TAB为4个空格
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" 开启光亮光标行
set cursorline
" 代码折叠
set foldmethod=indent  " 设置默认折叠方式为缩进
set foldlevel=99
set foldlevelstart=99 " 每次打开文件时关闭折叠
" 缩进 indentLine
let g:indent_guides_guide_size = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进
" 忽略大小写
set ignorecase
" 语法高亮
syntax on
" set background=dark
" set background=light
" json 不隐藏双引号
autocmd FileType json,markdown let g:indentLine_conceallevel=0
" ctag
set tags=./.tags;,.tags

set shell=zsh
set shellcmdflag=-c


" ▶ true color
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif
" △ 


" ▶ 自定义
nnoremap <F5> :CocCommand python.execInTerminal<CR>
" tagbar
nmap <F8> :TagbarToggle<CR>
" git
noremap <leader>gb :Git blame<CR>
" buffer 操作
noremap <M-h> :bp<CR>
noremap <M-l> :bn<CR>
" △ 

" ▶ 插件配置
for f in split(glob('~/.config/nvim/plug.vimrc.d/*.vimrc'), '\n')
    exec 'source' f
endfor
" △ 

" ▶ gopls go的lsp
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" △ 


" ▶ python-syntax
let g:python_highlight_all = 1
let g:python_version_2 = 1
" △ python-syntax


" ▶ ale 自动检查
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
" △ 


" ▶ 自动索引
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" △ 


" ▶ 快速跳转 start
" let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" nmap <Leader><Leader>j <Plug>(easymotion-j)
" nmap <Leader><leader>h <Plug>(easymotion-linebackward)
" nmap <Leader><Leader>k <Plug>(easymotion-k)
" nmap <Leader><leader>l <Plug>(easymotion-lineforward)
" nmap <Leader><leader>s <Plug>(easymotion-s)
" " 重复上一次操作, 类似repeat插件, 很强大
" map <Leader><leader>. <Plug>(easymotion-repeat)
" △ 快速跳转 end
