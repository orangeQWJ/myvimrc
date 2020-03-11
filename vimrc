let mapleader=" "
inoremap jj <Esc>`^
"map \r gg<C-v>G=`^




" 打开
set number


"打开语法高亮。自动识别代码，使用多种颜色显示。
syntax enable
syntax on


"set mouse=a
"支持使用鼠标。

set encoding=utf-8  
"使用 utf-8 编码。

set t_Co=256
"启用256色。


filetype indent on
"开启文件类型检查，并且载入与该类型对应的缩进规则。比如，如果编辑的是.py文件，vim 就是会找 python 的缩进规则~/.vim/indent/python.vim。


set autoindent
"按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致。

set tabstop=4
"按下 tab 键时，vim 显示的空格数。


set shiftwidth=4
"在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数。

set expandtab
"由于 tab 键在不同的编辑器缩进不一致，该设置自动将 tab 转为空格。

set softtabstop=4
"Tab 转为多少个空格。


set number
"显示行号


set relativenumber
"显示光标所在的当前行的行号，其他行都为相对于该行的相对行号。


set cursorline
"光标所在的当前行高亮。


set textwidth=80
"设置行宽，即一行显示多少个字符。



set wrap
"自动折行，即太长的行分成几行显示。


"set nowrap "关闭自动折行


set linebreak
"只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。


set wrapmargin=2
"指定折行处与编辑窗口的右边缘之间空出的字符数。


set scrolloff=5
"垂直滚动时，光标距离顶部/底部的位置（单位：行）。



set sidescrolloff=15
"水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用。



set laststatus=2
"是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。


set  ruler
"在状态栏显示光标的当前位置（位于哪一行哪一列）。



set showmatch
"光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号。



set hlsearch
"搜索时，高亮显示匹配结果。


set incsearch
"输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。



set ignorecase
"搜索时忽略大小写。



set smartcase
"如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。



"set spell spelllang=en_us
"打开英语单词的拼写检查。



set visualbell
"出错时，发出视觉提示，通常是屏幕闪烁。


set history=1000
"Vim 需要记住多少次历史操作。



set autoread
"打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。


"-----------------------------------------------------------------
" 屏幕标签快捷键
nnoremap R :source $MYVIMRC<CR>
nnoremap sd :set splitright<CR>:vsplit<CR>
nnoremap sa :set nosplitright<CR>:vsplit<CR>
nnoremap sw :set nosplitbelow<CR>:split<CR>
"nnoremap ss :set splitbelow<CR>:split<CR>

nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j

nnoremap <up> :res -1<CR>
nnoremap <down> :res +1<CR>
nnoremap <left> :vertical resize+1<CR>
nnoremap <right> :vertical resize-1<CR>

nnoremap tu :tabe<CR>
nnoremap th :-tabnext<CR>
nnoremap tl :+tabnext<CR>

nnoremap sv <C-w>t<C-w>H
nnoremap sh <C-w>t<C-w>K
"-------------------------------------------------------------------------
"
"
"
"
"
"
"
"
"
"
"插件安装
call plug#begin('~/.vim/plugged')

"----------------------------------------------------
"开屏工具
Plug 'mhinz/vim-startify'  

"----------------------------------
"状态栏
Plug 'vim-airline/vim-airline' "状态栏
Plug 'vim-airline/vim-airline-themes'  "状态栏主题


"----------------------------------
Plug 'scrooloose/nerdtree' "文件树
nnoremap <leader>v  :NERDTreeFind<cr> "编辑ing的文件所在的目录 配合<C-w>p 跳回来正在正编辑的窗口
nnoremap <leader>g  :NERDTreeToggle<cr> "关/开 
let NERDTreeShowHidden=1 "隐藏文件可见
"autocmd vimenter * NERDTree  "打开vim时自动打开
"-----------------------------------
"缩进线
Plug 'Yggdroot/indentLine'


"---------------------- 
"快速根据文件名打开文件
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map= '<c-p>' "<c-p> 搜索



"-------------------------
"文件内快速跳转
Plug 'easymotion/vim-easymotion'



"-------------------------------
"vim -go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"---------------------
"Python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }



"------------------
"代码补全
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"for go
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

"for python
Plug 'deoplete-plugins/deoplete-jedi'
"-----------------------------------------------------




"-----------------------------------------------------------------------------
"主题安装
Plug 'connorholyday/vim-snazzy' "主题安装
Plug 'W0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
"------------------------------------------------------------------------


call plug#end()

"==========================================================================
"快速跳转
nmap ss <Plug>(easymotion-s2) 
"插件的快捷键
"
"代码补全设置
set completeopt-=preview
let g:deoplete#enable_at_startup = 1

let g:pymode_python='python3'
let g:pymode_rope_goto_defintion_bind="<C-]>"
let g:pymode_lint=1


"===============================================================================

"---------------------------
"主题设置
color snazzy 
"color hybrid
"color solarized        
"color gruvbox
"------------------------------------


""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                "        exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc











"------------------------------------------
"<c-f> <c-u> 翻页
























"
"1.vim中文文档不会覆盖原英文文档，安装后vim默认使用中文文档。若想使用英文文档，可在vim中执行以下命令：
     "set helplang=en
"同理，使用以下命令可重新使用中文文档：
     "set helplang=cn
"2. 帮助文件的文本是utf-8编码的, 如果想用vim直接查看, 需要在~/.vimrc中设置:
   ""set encoding=utf-8




