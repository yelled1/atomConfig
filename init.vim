"let mapleader="\<SPACE>"
"
" configure expanding of tabs for various file types
"au BufRead,BufNewFile *.sc      set noexpandtab
"au BufRead,BufNewFile *.scala   set noexpandtab
au BufRead,BufNewFile *.py      set expandtab
au BufRead,BufNewFile *.c       set noexpandtab
au BufRead,BufNewFile *.h       set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
" -----------------------------------------------------------------------
" Syntax and indent
" -----------------------------------------------------------------------
syntax on   		" syntax highlighting turn it on
scriptencoding utf8
set encoding=utf-8
set showmatch "Show matching bracets when text indicator is over them
set hls       " highlight search
set lbr       " linebreak
set expandtab       " enter spaces when tab is pressed
set softtabstop=2   " Use 2 space instead of tab during format
set shiftwidth=2    " number of spaces to use for auto indent
"set textwidth=120   " break lines when line length increases
"set tabstop=4       " use 4 spaces to represent tab
"set autoindent      " Copy indent from the row above
set si              " Smart indent
set mouse=a         " Enable the use of the mouse.
set wildmenu
set nocompatible    "Not vi compativle (Vim is king)
set guicursor=
" -----------------------------------------------------------------------
" make backspaces more powerfull
" -----------------------------------------------------------------------
set backspace=indent,eol,start  " make backspaces more powerful
set ruler                       " show line and column number
set number                      " show line and column number
set showcmd 		        " show (partial) command in status line
"_______________________________________________________________________
if has("win32")
  let g:python3_host_prog='C:/Bin/Miniconda3/python.exe'
  let g:python_host_prog='C:/Bin/miniconda2/python.exe'
  nnoremap <silent> ,te :e ~/AppData/Local/nvim/init.vim<CR>
  nnoremap <silent> ,tev :e E:/Bin/gVimPortable/App/vim<CR>
elseif has("unix")
  let g:python2_host_prog = '/usr/bin/python2'
  "let g:python3_host_prog = '/opt/miniconda3/bin/python'
  "nnoremap <silent> ,te :e $XDG_CONFIG_HOME/nvim/init.vim<CR>
  nnoremap <silent> ,te :e $HOME/.config/nvim/init.vim<CR>
end
"_______________________________________________________________________
"let g:molokai_original = 1
"let g:rehash256 = 1
:color distinguished
":color molokai
""set colorscheme = "one"(one is the name of color scheme)
"if exists('g:nyaovim_version')
"  syntax enable
"  colorscheme impact3
"  set background=dark
"  let g:solarized_termcolors=256
"  colorscheme solarized
"  call togglebg#map("<F5>")
"endif
"set guifont=Monaco:h10
"set guifont=Monospace:h20
"_______________________________________________________________________
" https://github.com/junegunn/vim-plug
"call plug#begin('~/.vim/plugged') This was For old vim 
call plug#begin('~/.local/share/nvim/site/plugged')
"Plug 'derekwyatt/vim-scala'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
"Plug 'ensime/ensime-vim' 
Plug 'Raimondi/delimitMate'
"Plug 'Valloric/YouCompleteMe' "NeoComplete Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
"Plug 'JuliaEditorSupport/deoplete-julia' "Depreciated for LanguageClient
"Plug 'JuliaEditorSupport/julia-vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
" above 3 are for julia
Plug 'kassio/neoterm'
Plug 'vim-scripts/indentpython.vim'
"Plug 'nvie/vim-flake8'
Plug 'tmhedberg/SimpylFold'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jnurmine/Zenburn' 
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
" Git commands
Plug 'tpope/vim-fugitive'
"Plug 'nyaovim-markdown-preview'
"Plug bfredl/nvim-ipy
call plug#end()
"*** Reload .vimrc and :PlugInstall to install plugins. <<<<<
"*** for nvim :UpdateRemotePlugins as well
"--- for YCM compile YCMd by install.py in Plugin Directory ---!!!
"_______________________________________________________________________
" Ensime Reelated
" Type Checking After Code save :w
autocmd BufWritePost *.scala silent :EnTypeCheck
" Easy Type Inspection
"au FileType scala nnoremap <localleader>t :EnType<CR>
au FileType scala nnoremap <silent>t :EnType<CR>
"Navigating Jumping to definition The default command is :EnDeclaration
au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
"EnsimeTypechecking after writing
autocmd BufWritePost *.scala silent :EnTypeCheck

"_______________________________________________________________________
"map <F5> :bnext<CR> " Currently MAP to :bn
"<NL> in LXterm NOT C-CR,Enter,Return
inoremap <silent> <NL> <C-O>:TREPLSendLine<CR>
nnoremap <silent> <NL> :TREPLSendLine<CR>j0
vnoremap <silent> <NL> $:TREPLSendSelection<CR>'>j

"ONLY for nyaoVim: <C-CR> & <C-`> works !!!!!!
""from insertM temp to normalM to exec then back to insert
inoremap <silent> <C-CR> <C-O>:TREPLSendLine<CR>
nnoremap <silent> <C-CR> :TREPLSendLine<CR>j0
vnoremap <silent> <C-CR> $:TREPLSendSelection<CR>'>j

inoremap <silent> <C-v> <C-O>"+p
nnoremap <silent> <C-v> "+p
vnoremap <silent> <C-c> "+y

"___ keyMaps ___________________________________________________________
"(:h CTRL-W_w) lists both mappings as being equivalent.
noremap <C-`> <C-W>w
inoremap <C-`> <C-O><C-W>w
tnoremap <C-`> <c-\><c-n><c-w><c-w>
noremap <C-x>o <C-W>w
inoremap <C-x>o <C-O><C-W>w
tnoremap <C-x>o <c-\><c-n><c-w><c-w>

"_______________________________________________________________________
" NeoTerm
let g:neoterm_autoscroll=1       "if you want to open neoterm in the Auto Scroll 
"let g:neoterm_autoinsert=1      " &  Insert/terminal mode you can set it with 
"let g:neoterm_position = 'horizontal' " Depreciated
let g:neoterm_automap_keys = ',tt'

if has("win32")
  "let g:neoterm_direct_open_repl = 1 " causes file directory NOT found error
  "let g:neoterm_auto_repl_cmd = 1
  "let g:neoterm_repl_command = 'E:/Bin/bash/bash.exe'
  set termencoding=utf8
  "let g:neoterm_repl_python = 'C:/Bin/Miniconda3/envs/wSPk/Scripts/python.exe' "--no-autoindent'
  let g:neoterm_repl_julia = 'C:/tools/Julia/bin/julia.exe'
  let g:neoterm_eof = "\r"
elseif has("unix")
  let g:neoterm_repl_julia = '/opt/julia/bin/julia'
  "let g:neoterm_repl_python = '/usr/bash'
  "let g:neoterm_repl_python = '/opt/miniconda3/envs/SPk/bin/ipython --no-autoindent'
  "let g:neoterm_repl_scala = '/usr/bin/sbt console'
endif

" hide/show terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
nnoremap <silent> ,ts :call neoterm#open()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tk :call neoterm#kill()<cr>
" exit term Mode Back to normal mode
tnoremap <ESC><ESC> <C-\><C-N>

"_______________________________________________________________________
" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap ,fc za
let g:SimpylFold_docstring_preview=1
"_______________________________________________________________________

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"map <C-w>t :NERDTreeToggle<CR>
map <C-\> :NERDTreeToggle<CR>

au BufNewFile,BufRead *.py
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, *.scala, *.jl
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

"_______________________________________________________________________
" deopltete Section 
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#omni#input_patterns = {}
" below is alt web init.vim
"let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns.scala = [
  \ '[^. *\t]\.\w*',
  \ '[:\[,] ?\w*',
  \ '^import .*'
  \]
"let g:deoplete#omni#input_patterns.python = '' 
let g:deoplete#sources#jedi#server_timeout = 60
let g:deoplete#sources#jedi#show_docstring = 1 
"let g:deoplete#sources#jedi#python_path = '/opt/miniconda3/envs/SPk/bin/python'
"g:deoplete#sources#jedi#python_path: Set the Python interpreter path to use for the completion server. deoplete-jedi uses the first available python in $PATH. Use this only if you want use a specific Python interpreter. This has no effect if $VIRTUAL_ENV is present in the environment. Note: This is completely unrelated to configuring Neovim.
"g:deoplete#sources#jedi#debug_server: Enable logging from the server. If set to 1, server messages are emitted to Deoplete's log file. This can optionally be a string that points to a file for separate logging. The log level will be inherited from deoplete#enable_logging().
"g:deoplete#sources#jedi#extra_path: A list of extra paths to add to sys.path when performing completions.

" julia deopltete Section 
"_______________________________________________________________________
" https://github.com/JuliaEditorSupport/LanguageServer.jl/wiki/Neovim
let g:default_julia_version = '0.6'
" language server
let g:LanguageClient_autoStart = 1

if has("win32")
  let g:LanguageClient_serverCommands = {
  \   'julia': ['C:/tools/Julia/bin/julia.exe', '--startup-file=no', '--history-file=no', '-e', '
  \       using LanguageServer;
  \       server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
  \       server.runlinter = false;
  \       run(server);
  \   '],
  \ }
else
  let g:LanguageClient_serverCommands = {
  \   'julia': ['/opt/julia/bin/julia', '--startup-file=no', '--history-file=no', '-e', '
  \       using LanguageServer;
  \       server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
  \       server.runlinter = false;
  \       run(server);
  \   '],
  \ }
endif

"=== Get LanguageClientStart error
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"_______________________________________________________________________
"let g:ycm_autoclose_preview_window_after_completion=1 
"" THIS SEEM TO mess w/ TAB COMPLETION
""map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"_______________________________________________________________________
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
let python_highlight_all=1
"_______________________________________________________________________
let $BROWSER = '/usr/bin/firefox %s'
"let BROWSER='/usr/bin/google-chrome-stable %s'
"_______________________________________________________________________
" to find files & so on but use https://github.com/Shougo/denite.nvim Instead???
"Plug 'kien/ctrlp.vim'
"Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"let g:powerline_pycmd="py3"
"set clipboard=unnamed ????
"___________________________________________________________
filetype plugin indent on
filetype on
au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
au VimEnter,BufRead,BufNewFile *.scala set filetype=scala
au VimEnter,BufRead,BufNewFile *.py set filetype=python
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"let g:powerline_pycmd="py3"
"set clipboard=unnamed ????
"
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = '<Leader>ga'  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = '<Leader>gd'  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 1
let g:jedi#smart_auto_mappings = 1

" Unite/ref and pydoc are more useful.
let g:jedi#documentation_command = '<Leader>_K'
let g:jedi#auto_close_doc = 1
"
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
"let g:airline_theme= 'term'
