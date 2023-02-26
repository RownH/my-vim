set nocompatible
" 文件格式开启
syntax on
set nu!
filetype on
filetype plugin on
" 允许用退格键删除字符
set backspace=indent,eol,start           
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'tpope/vim-surround'
Plugin 'preservim/nerdcommenter'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf.vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'frazrepo/vim-rainbow'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dracula/vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'ianding1/leetcode.vim'




call vundle#end()
" NERDTree 树形，目录
" 设置快捷键
map <C-e> :NERDTreeToggle<CR>
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion               = 2 " 输入第 2 个字符开始补全
let g:ycm_seed_identifiers_with_syntax                  = 1 " 语法关键字补全
let g:ycm_complete_in_comments                          = 1 " 在注释中也可以补全
let g:ycm_complete_in_strings                           = 1 " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_tag_files            = 1 " 使用 ctags 生成的 tags 文件
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_cache_omnifunc                                = 0 " 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_use_ultisnips_completer                       = 0 " 不查询 ultisnips 提供的代码模板补全，如果需要，设置成 1 即可
let g:ycm_show_diagnostics_ui                           = 0 " 禁用语法检查
let g:ycm_key_list_select_completion   = ['<C-n>']   " 选择下一条补全，Default: ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>']     " 选择上一条补全，Default: ['<S-TAB>', '<Up>']
let g:ycm_key_list_stop_completion     = ['<Enter>']  " 中止此次补全，Default: ['<C-y>']
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" 标签
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags' " tagbar 依赖 ctags 插件
let g:tagbar_width     = 30      " 设置 tagbar 的宽度为 30 列，默认 40 列
let g:tagbar_autofocus = 1       " 打开 tagbar 时光标在 tagbar 页面内，默认在 vim 打开的文件内
let g:tagbar_left      = 1       " 让 tagbar 在页面左侧显示，默认右边
let g:tagbar_sort      = 0       " 标签不排序，默认排序


" 主题 colorscheme + 空格 + tab 可以切换
colorscheme koehler
set nu
let g:airline_powerline_fonts                   = 1 " 使用 powerline 打过补丁的字体
let g:airline#extensions#tabline#enabled        = 1 " 开启 tabline
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示 buffer 编号
let g:airline#extensions#ale#enabled            = 1 " enable ale integration
 
" 状态栏显示图标设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.crypt     = '?'
let g:airline_symbols.linenr    = '⭡'
let g:airline_symbols.branch    = '⭠'

let g:ale_lint_on_text_changed       = 'normal'                     " 代码更改后启动检查
let g:ale_lint_on_insert_leave       = 1                            " 退出插入模式即检查
let g:ale_sign_column_always         = 1                            " 总是显示动态检查结果
let g:ale_sign_error                 = '>>'                         " error 告警符号
let g:ale_sign_warning               = '--'                         " warning 告警符号
let g:ale_echo_msg_error_str         = 'E'                          " 错误显示字符
let g:ale_echo_msg_warning_str       = 'W'                          " 警告显示字符
let g:ale_echo_msg_format            = '[%linter%] %s [%severity%]' " 告警显示格式

" 括号显示
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" C 语言配置检查参数
let g:ale_c_gcc_options              = '-Wall -Werror -O2 -std=c11'
let g:ale_c_clang_options            = '-Wall -Werror -O2 -std=c11'
let g:ale_c_cppcheck_options         = ''
" C++ 配置检查参数
let g:ale_cpp_gcc_options            = '-Wall -Werror -O2 -std=c++14'
let g:ale_cpp_clang_options          = '-Wall -Werror -O2 -std=c++14'
let g:ale_cpp_cppcheck_options       = ''

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang', 'gcc'],
\   'c': ['clang', 'gcc'],
\   'python': ['pylint'],
\   'go': ['golint', 'go vet', 'go fmt'],
\}
" <F9> 触发/关闭代码动态检查
map <F9> :ALEToggle<CR>
"普通模式下，ak 前往上一个错误或警告，aj 前往下一个错误或警告
nmap wk <Plug>(ale_previous_wrap)
nmap wj <Plug>(ale_next_wrap)
" ad 查看错误或警告的详细信息
nmap wd :ALEDetail<CR>


" git 配置
"通过 [c 和 ]c 在有所变动的区块间跳转。
"hp，显示预览，hunk preview
"hs，暂存代码块，hunk stage
"hu，撤销更改，hunk undo
highlight GitGutterAdd    ctermfg=blue
highlight GitGutterChange ctermfg=green
highlight GitGutterDelete ctermfg=red
nmap <C-]]> <Plug>(GitGutterNextHunk)
nmap <C-[[> <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)

"go配置

" vim-go
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1
" let g:go_bin_path = '$GOBIN'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" 快速预览 查看文件
map <C-p> :Files<CR>
map <C-P> :Buffers<CR>

" 修改后刷新文件时间
let updatetime=100
" 快速关闭
nnoremap <leader>a :cclose<CR>

" 异步执行
noremap <F7> :AsyncRun gcc "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENAME)" <cr> 

" 防止误触
inoremap <F1> <Esc>
nnoremap <F1> <Esc>

" lc配置
let g:leetcode_china=1  "中国区leetcode"
let g:leetcode_solution_filetype='python3'    "默认使用python3"
let g:leetcode_browser='chrome'   "登录leetcode-cn.com的浏览器"
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
