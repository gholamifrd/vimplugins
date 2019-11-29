" .........BASICS...........
"Force to use python3 python3
"if exists('py2') && has('python')
"elseif has('python3')
"endif
" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off
" pathogen runtime injection and help indexing
call pathogen#infect()
call pathogen#helptags()
" turn filetype detection, indent scripts and filetype plugins on
" and syntax highlighting too
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamed,unnamedplus
" Show status bar and line number
set laststatus=2
set noshowmode
set number
set relativenumber
" Search Settings
set ignorecase
set smartcase
set incsearch

"..........COLORS...........

""""""""""""""""" one dark 24 color settings""""""""""""""""""""""
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
""""""""""""""""""""""until here one dark theme 24 color settings""""

"...........KEYS............

no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
imap jj <Esc>
nmap OO O<Esc>j
nmap oo o<Esc>k
let mapleader = ","
noremap! <Leader>h <left>  
noremap! <Leader>j <down>  
noremap! <Leader>k <up>    
noremap! <Leader>l <right> 
noremap! <Leader>w <esc>wi 
noremap! <Leader>e <esc>ei 
noremap! <Leader>b <esc>bi  
set showmatch
nmap <F7> :tabp <CR>
nmap <F8> :tabn <CR>
map <C-n> :NERDTreeToggle <CR>

"..........AUTOCOMPLETION...........

" <TAB>: completion.
let g:SuperTabDefaultCompletionType = "<c-n>"
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0
let g:jedi#show_call_signatures = "2"
let g:user_emmet_leader_key=','
set tabstop=4       " The width of a TAB is set to 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Set ultisnips triggers
"let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
"let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
autocmd FileType py UltiSnipsAddFiletypes python
let g:UltiSnipsSnippetsDir="$HOME/.vim/bundle/vim-snippets"


"..........PYTHON.............

" run python inside vim using F5
map <F5> :w! !python<CR>
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

"Python mode configs:
let g:pymode_lint_ignore = ["W"]
let g:pymode_lint_checkers = ['pep8']
"let g:pymode_lint_on_fly = 1
set pyxversion=3

"...........C++.................

"Clang_Complete
"for ubuntu 16.04 clang_complete
let g:clang_library_path="/usr/lib/llvm-3.8/lib/libclang.so.1"
"for arch linux
"let g:clang_library_path="/usr/lib/libclang.so.8"
let g:clang_complete_copen=1
let g:clang_complete_auto=0
let g:clang_user_options='|| exit 0'
let g:clang_use_library=1
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_jumpto_declaration_key = '<F1>'
" ctags optimization
set autochdir
set tags=tags;
" Set GNU C,C++ Coding Standards
function! GnuIndent()
    setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
    setlocal shiftwidth=2
    setlocal tabstop=8
endfunction
au FileType c,cpp,cc call GnuIndent()
au BufEnter /usr/include/* call GnuIndent()

".........MISC.........
" Auto Save configs
let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_in_insert_mode = 0
"Codi
let g:codi#width = 50.0
