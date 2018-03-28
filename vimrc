" 关闭兼容模式
set nocompatible
" 让配置变更立即生效-容易保存卡死
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 自适应不同语言的智能缩进
filetype indent on
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 开启语法高亮功能
syntax enable

" 配色
set background=dark
colorscheme desert
set encoding=utf-8
" solarized colorscheme
if has('gui_running')
	set background=light
else
	set background=dark
endif
let g:solarized_termcolors=256


" 禁用箭头方向键 ↑ ↓ ← →
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number


" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
"c文件自动缩进
set cindent
"自动对齐
set autoindent
"智能缩进
set smartindent


" 高亮显示当前行/列
" set cursorcolumn
set cursorline
"文件自动检测外部更改
set autoread

"高亮查找匹配
set hlsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

"-------------------------------------------------
" 插件管理
call plug#begin('~/.vim/plugged')
" 智能补全
Plug 'Valloric/YouCompleteMe'
" 多语言高亮配色
Plug 'sheerun/vim-polyglot'

Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/c.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'justmao945/vim-clang'
" 头文件/源文件快速跳转
Plug 'derekwyatt/vim-fswitch'

" go/rust
" Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'

Plug 'mattn/emmet-vim'

" Plug 'python-mode/python-mode'
" Plug 'ivanov/vim-ipython'
Plug 'davidhalter/jedi-vim'
" import 整理
Plug 'timothycrosley/isort'

" 语法检查
Plug 'w0rp/ale'

"代码排版，格式化
" Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
" 变量显示栏
Plug 'majutsushi/tagbar'

" 注释
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 搜索
Plug 'kien/ctrlp.vim'
" 括号
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'

" 代码片段
Plug 'SirVer/ultisnips'
" 显示行尾多余的空格
Plug 'vim-scripts/ShowTrailingWhitespace'

call plug#end()


" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/home/kristoffer/Workspace/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1


" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=48
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


" python 代码格式化
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>
" python 整理import项(timothycrosley/isort)
autocmd FileType python nnoremap <leader>i :!isort %<CR><CR>


" vim-fswitch 配置
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

"strip all trailing whitespace in the current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>


" sudo 写入
command W w !sudo tee % > /dev/null

" 特定语言禁止高亮
" let g:polyglot_disabled = ['css']