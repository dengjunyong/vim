
" 'compatible'."任何其他的设置选项都应该放在nocompatible之后
set nocompatible " 告诉 Vim 工作在 vi 增强模式,因此与 Vi 不完全兼容,去掉讨厌的有关vi一致性模式,避免以前版本的一些bug和局限
filetype off  "vundle 要求

set helplang=cn "中文帮助文档
set encoding=utf-8 "中文帮助文档使用utf-8编码, encoding是Vim的内部使用编码,encoding的设置会影响Vim内部的Buffer、消息文字等。在Unix环境下,encoding的默认设置等于locale
"set fileencodings=gb2312,gb18030,utf-8 "Vim在打开文件时会根据fileencodings选项来识别文件编码,fileencodings可以同时设置多个编码,Vim会根据设置的顺序来猜测所打开文件的编码。
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8 "Vim在保存新建文件时会根据fileencoding的设置编码来保存。如果是打开已有文件,Vim会根据打开文件时所识别的编码来保存,除非在保存时重新设置fileencoding
"termencodings（tenc）：在终端环境下使用Vim时,通过termencoding项来告诉Vim终端所使用的编码。

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
"if has("syntax")
syntax enable
syntax on            " 语法高亮
"endif
"colorscheme ron        " elflord ron peachpuff default 设置配色方案,vim自带的配色方案保存在/usr/share/vim/vim73/colors目录下
colorscheme desert "颜色方案

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Keep Plugin commands between vundle#begin/end.

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'taglist.vim'
Plugin 'cscope.vim'
Plugin 'winmanager'
Plugin 'The-NERD-tree'
Plugin 'OmniCppComplete'
Plugin 'SuperTab'
Plugin 'a.vim'
Plugin 'c.vim'
"Plugin 'echofunc.vim'
Plugin 'bufexplorer.zip'
Plugin 'minibufexpl.vim'
Plugin 'vimwiki'
Plugin 'L9'
Plugin 'git@github.com:wesleyche/SrcExpl.git'
Plugin 'git@github.com:wesleyche/Trinity.git'
Plugin 'lua-support'
"Plugin 'lua.vim'
Plugin 'https://github.com/xolox/vim-lua-ftplugin.git'  "等效于 Plugin 'lua.vim'
Plugin 'https://github.com/xolox/vim-misc.git'  "lua.vim(vim-lua-ftplugin)依赖vim-misc
Plugin 'lua_omni'

call vundle#end()            " required


" detect file type
"filetype on "侦测文件类型,vundle要求off
filetype plugin on  "载入文件类型插件
filetype indent on  "为特定文件类型载入相关缩进文件

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"have Vim load indentation rules and plugins according to the detected filetype
filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

set ignorecase        " 搜索模式里忽略大小写
set smartcase        " 如果搜索模式包含大写字符,不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite        " 自动把内容写回文件: 如果文件被修改过,在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set cindent
set autoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set smartindent        " 智能对齐方式
"在Vim中还可以进行自动缩进,主要有cindent、smartindent和autoindent三种。
"cindent Vim可以很好的识别出C和Java等结构化程序设计语言,并且能用C语言的缩进格式来处理程序的缩进结构。
"autoindent在这种缩进形式中,新增加的行和前一行使用相同的缩进形式。可以使用以下命令,启用autoindent缩进形式。
"smartindent在这种缩进模式中,每一行都和前一行有相同的缩进量,同时这种缩进形式能正确的识别出花括号,当遇到右花括号（}）,则取消缩进形式。此外还增加了识别C语言关键字的功能。如果一行是以#开头的,那么这种格式将会被特殊对待而不采用缩进格式。
set tabstop=4        " 设置制表符(tab键)的宽度
set softtabstop=4     " 设置软制表符的宽度    
set shiftwidth=4    " (自动) 缩进使用的4个空格,设置缩进宽度
set expandtab        "将Tab键更改为四个空格, 同set et, set et!恢复成制表符
set cindent            " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
set backspace=2    " 设置退格键可用
set showmatch        " 插入括号时,短暂地跳转到匹配的对应括号
set matchtime=2      " 短暂跳转到匹配括号的时间
set linebreak        " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set hidden " 允许在有未保存的修改时切换缓冲区,此时的修改由 vim 负责保存
"set mouse=a            " Enable mouse usage (all modes)    "使用鼠标
set number            " Enable line number    "显示行号
"set previewwindow    " 标识预览窗口
set history=50        " set command history to 50    "历史记录50条


"--状态行设置--
set laststatus=2     " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler            " 标尺,用于显示光标位置的行号和列号,逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行,标尺在那里显示。否则,它显示在屏幕的最后一行上。

"--命令行设置--
set showcmd            " 在 Vim 窗口右下角,标尺的右边显示未完成的命令,命令行显示输入的命令
set showmode        " 命令行显示vim当前模式

"--find setting--
set incsearch        " 输入字符串就显示匹配点
set hlsearch         " 高亮匹配点
"set nowrapscan       " 禁止在搜索到文件两端时重新搜索

"set clipboard+=unnamed  "与Windows共享剪贴板
autocmd! bufwritepost _vimrc source $VIM/_vimrc "编辑vimrc之后,重新加载

"mm命令删除windows回车
nmap mm :%s/\r//g<cr>



"-- WinManager setting --
"let g:winManagerWindowLayout='BufExplorer,NERDTree|TagList'  "设置我们要管理的插件,使用”,”分隔的插件,在同一个窗口中显示,使用”CTRL-N“在不同插件间切换；使用”|”分隔的插件,则在另外一个窗口中显示
let g:winManagerWindowLayout='TagList|BufExplorer|FileExplorer'
"let g:winManagerWindowLayout='FileExplorer|TagList'  "设置我们要管理的插件
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了,退出vim
"let g:bufExplorerMaxHeight=30 "设置taglistbuffer的最高限制
"let g:winManagerWidth=20
let g:defaultExplorer=1
nmap <silent> fir :FirstExplorerWindow<cr>
nmap <silent> bot :BottomExplorerWindow<cr>
nmap <silent> wm :WMToggle<cr>
"<silent>是指执行键绑定时不在命令行上回显,比如： 
":map <silent> ,w /abcd<CR>
"你在输入,w查找abcd时,命令行上不会显示/abcd,如果没有<silent>参数就会显示出来 
"定义打开关闭winmanager按键
nmap <silent> <F8> :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

"===================== NERDTree ================
let g:NERDTreeWinPos='right' "右侧
nmap nt :NERDTreeToggle<CR>
"NERD Tree设置名称
let g:NERDTree_title="[NERD Tree]"
"winManager setting
"设置界面分割
"NERD Tree配置
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

" -- bufexplorer -- 
nmap bf :BufExplorer<cr>

" -- MiniBufferExplorer --
let g:miniBufExplMapWindowNavVim = 1 "按下Ctrl+h/j/k/l,可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 "按下Ctrl+箭头,可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 "启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
let g:miniBufExplMapCTabSwitchWindows = 1 "启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1    "不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
"let g:miniBufExplorerMoreThanOne=0 "这个设置保证在打开0个以上的文件是最高限制都是有用的

"--fold setting--
set foldmethod=syntax  "用语法高亮来定义折叠
set foldlevel=100  "启动vim时不要自动折叠代码
set foldcolumn=2  "设置折叠栏宽度

"-- QuickFix setting --
"vim的quickfix模式,quickfix是vim自带的,无需插件
"按下F6,执行make clean
map <F6> :make clean<CR><CR><CR>
"按下F7,执行make编译程序,并打开quickfix窗口,显示编译信息
map <F7> :make<CR><CR><CR> :copen<CR><CR>
"按下F8,光标移到上一个错误所在的行
"map <F8> :cp<CR>
"按下F9,光标移到下一个错误所在的行
"map <F9> :cn<CR>
"以上的映射是使上面的快捷键在插入模式下也能用
imap <F6> <ESC>:make clean<CR><CR><CR>
imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
"imap <F8> <ESC>:cp<CR>
"imap <F9> <ESC>:cn<CR>

" Open and close all the three plugins on the same time
nmap tra   :TrinityToggleAll<CR> 
" Open and close the srcexpl.vim separately 
nmap trs   :TrinityToggleSourceExplorer<CR> 
" Open and close the taglist.vim separately 
nmap trt  :TrinityToggleTagList<CR> 
" Open and close the NERD_tree.vim separately 
nmap trn  :TrinityToggleNERDTree<CR> 

"--ctags setting--
"按下F5重新生成tag文件,并更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --fields=+lS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --fields=+lS --extra=+q .<CR><CR> :TlistUpdate<CR>
"--c++-kinds=+p : 为C++文件增加函数原型的标签
"--fields=+iaS :在标签文件中加入继承信息(i)、类成员的访问控制信息(a)、以及函数的指纹(S)
"--fields=+lS :echofunc需要
"--extra=+q : 为标签增加类修饰符。注意,如果没有此选项,将不能对类成员补全
"-R : 递归生成src中所有源文件的tags文件
"set tags+=./tags
set tags+=/usr/include/tags
set tags+=/usr/local/include/tags
set tags+=/usr/src/linux-headers-3.13.0-37/tags
"CTRL+]就会跳转到对应的定义,CTRL+o可以回退到原来的地方。如果当前光标下是个局部变量,gd跳到这个局部变量的定义处。

 "-- Taglist setting --
nmap tl :TlistToggle<CR>
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里,所以可以直接执行
"let Tlist_Use_Right_Window=0 "让窗口显示在右边,0的话就是显示在左边
let Tlist_Show_One_File=0
"让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1
"非当前文件,函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1
"当taglist是最后一个分割窗口时,自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0

"sourceexplorer
nmap se :SrcExplToggle<CR>

let g:SrcExpl_winHeight = 8     "默认高度
let g:SrcExpl_refreshTime = 100 "更新时间(ms)
let g:SrcExpl_isUpdateTags = 0  "每次打开SrcExpl时是否更新tags(0为不更新)
"let g:SrcExpl_updateTagsKey = "<F12>"   "更新tags的快捷键
"映射光标在窗口间移动的快捷键
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

"系统粘贴板
nmap Y "+yy
nmap P "+p
