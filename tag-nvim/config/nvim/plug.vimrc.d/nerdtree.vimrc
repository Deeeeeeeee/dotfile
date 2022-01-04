" ▶ nerdtree
" 自动开启
if &diff
    " 关闭只读模式
    set noro
else
    autocmd vimenter * NERDTree
    wincmd w
    autocmd vimenter * wincmd w
endif
" CTRL+n开启nerdTree目录树
map <C-n> :NERDTreeToggle<CR>
" 定位到目录
noremap <C-m> :NERDTreeFind<CR>
" 当剩下唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree 宽度
let g:NERDTreeWinSize = 25
" 开启时自动显示Bookmarks
let NERDTreeShowBookmarks = 1
" 过滤文件
let NERDTreeIgnore = ['\.pyc$']
" 窗口切换
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
" △ nerdtree
