""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map <F10> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
"        exec "!g++ % -o %<"
"        exec "!time ./%<"
    elseif &filetype == 'cpp'
"        exec "!g++ % -o %<"
"        exec "!time ./%<"
    elseif &filetype == 'java'
"        exec "!javac %"
"        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'html'
"        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
"        exec "!~/.vim/markdown.pl % > %.html &"
"        exec "!firefox %.html &"
    endif
endfunc

"""""""""""""""
" My setting  "
"""""""""""""""
set shiftwidth=4
set expandtab
set tabstop=4
set number
set relativenumber 
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
nnoremap <C-PageUp> :set norelativenumber nonumber<CR>
nnoremap <C-PageDown> :set relativenumber number<CR>
"===================>>> vim vundle begin <<<===================###
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" Vim plugin manager
    Plugin 'VundleVim/Vundle.vim'
	" A tree explorer plugin for vim
    Plugin 'scrooloose/nerdtree'
	" lean & mean status/tabline for vim that's light as air
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
	" Using the jedi autocompletion library for VIM. (python)
    Plugin 'davidhalter/jedi-vim'
	" To display the indention levels with thin vertical lines
    Plugin 'Yggdroot/indentLine'
	" Insert or delete brackets, parens, quotes in pair
    Plugin 'jiangmiao/auto-pairs'
	" Autopep8 plugin for Vim
    Plugin 'tell-k/vim-autopep8'
	" Comment functions so powerful—no comment necessary.
    Plugin 'scrooloose/nerdcommenter'
	" A dark theme for Vim
	Plugin 'dracula/vim'
	"Syntax checking hacks for vim
	Plugin 'scrooloose/syntastic'
    "A maintained ctags implementation
    Plugin 'universal-ctags/ctags'
    "Markdown Vim Mode syntax hight light
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    "A light Vim plugin for previewing markdown files in a browser - without leaving Vim.
    Plugin 'JamshedVesuna/vim-markdown-preview'
    ""Instant Markdown previews from VIm!
    Plugin 'suan/vim-instant-markdown'

    "Perform all your vim insert mode completions with Tab
    "Plugin 'ervandew/supertab'
    " A code-completion engine for Vim
    "Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
"===================>>> vim vundle ending<<<===================###

"=================>>> vundle plugin begin <<<==================###
"""""""""""
" airline
"""""""""""
    "let g:airline#extensions#tabline#enabled = 1
    "let g:airline#extensions#tabline#buffer_nr_show = 1
    "let g:airline_powerline_fonts = 1
    "let g:airline#extensions#tabline#enabled = 1
    " buffer short cut
    noremap <C-N> :bn<CR>
    nnoremap <C-P> :bp<CR>
    let g:airline_theme='papercolor'
    "let g:airline_theme='solarized dark'
    let g:airline_powerline_fonts = 1  
    let g:airline#extensions#tabline#enabled = 1

""""""""""""""
" nerdtree
""""""""""""""
    "F2 open/close nerdtree
    map <F2> :NERDTreeToggle<CR>
    let NERDTreeChDirMode=1
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
    let NERDTreeWinSize=25

"""""""""""""""
" indentLine
"""""""""""""""
    let g:indentLine_char='┆'
    let g:indentLine_enabled = 1

"""""""""""""""
" autopep8
"""""""""""""""
    let g:autopep8_disable_show_diff=1
    let mapleader=','

"""""""""""""""""
" nerdcommenter 
"""""""""""""""""
	"map <F4> <leader>ci <CR>
	"map <C-_> <leader>ci <CR>
    " '_' reflect to '/'
	nmap <C-_> <Plug>NERDCommenterToggle
	vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

"""""""""""
" dracula
"""""""""""
    "set termguicolors
    "color dracula
	let g:dracula_italic = 0
	colorscheme dracula
	" Change the default(gray) background
	highlight Normal ctermbg=None

"""""""""""""""
" Syntastic
"""""""""""""""
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pep8'] " use pep8
let g:syntastic_javascript_checkers = ['jsl', 'jshint']"
highlight SyntasticErrorSign guifg=white guibg=black
" error location 
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
		let old_last_winnr = winnr('$')
		lclose
		if old_last_winnr == winnr('$')
		    " Nothing was closed, open syntastic error location panel
	        Errors
	    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>

"""""""""""""""
" jedi-vim
"""""""""""""""
" Use ctrl + I autocompletion
"let g:jedi#autocompletion_command = "<C-I>"
let g:jedi#completions_command = "<C-I>"
" Use Tab autocompletion
"let g:SuperTabDefaultCompletionType = "context"
" use . complete auto or not
let g:jedi#popup_on_dot = 1
" Don't show the preview window
autocmd FileType python setlocal completeopt-=preview
" Quick complete
let g:pymode_rope = 0

"""""""""""""""
" ctags
"""""""""""""""
" mapping
set tags+=/home/alopex/.vim/tags/python3.ctags
" adding python path
set path+=/usr/lib/python3.5
set path+=/usr/lib/python3.5/plat-x86_64-linux-gnu
set path+=/usr/lib/python3.5/lib-dynload
set path+=/home/alopex/.local/lib/python3.5/site-packages
set path+=/usr/local/lib/python3.5/dist-packages
set path+=/usr/lib/python3/dist-packages
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

"""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""
" vim-markdown-preview
"""""""""""""""""""""""
" github perview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-Right>'
"let vim_markdown_preview_hotkey='<C-m>'
"let vim_markdown_preview_browser='chromium-browser'

"""""""""""""""""""""""
" vim-instant-markdown
"""""""""""""""""""""""
filetype plugin on
nnoremap <C-Left> :InstantMarkdownPreview<CR>
" open mdfile auto preview
"let g:instant_markdown_slow = 0
" disable auto preview
let g:instant_markdown_autostart = 0
" 开放给网络上的其他人
"let g:instant_markdown_open_to_the_world = 1
" 允许脚本允许
"let g:instant_markdown_allow_unsafe_content = 1
" 阻止外部资源加载
"let g:instant_markdown_allow_external_content = 0

"""""""""""""""
"vim-markdown
"""""""""""""""
" auto folding
let g:vim_markdown_folding_disabled = 1
" Disable conceal 
let g:vim_markdown_conceal = 2
" conceal level short cut
nnoremap <C-Up> :set conceallevel=0<CR>
nnoremap <C-Down> :set conceallevel=2<CR>
"=================>>> vundle plugin end <<<==================###

