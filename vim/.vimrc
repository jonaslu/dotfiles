"*****************************************************************************
""" Plugins
"*****************************************************************************
call plug#begin(expand('~/.vim/plugged'))

"" Plug install packages
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'

"" Color
Plug 'tomasr/molokai'

call plug#end()

" Intent on
filetype plugin indent on

"" Map leader to ,
let mapleader=','

set nocompatible

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"" Disable backup file creation
set nobackup
set nowritebackup
set noswapfile

"" Searching
set hlsearch
set wrapscan
set incsearch
set ignorecase
set smartcase

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Visual Settings
syntax on
set ruler
set number

let no_buffers_menu=1
" Possibly change the airline theme to match
colorscheme molokai

set mousemodel=popup
set t_Co=256

let g:CSApprox_loaded = 1

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Qa qa

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" clear whitespace at end of line
noremap <Leader>rw :s/\s\+$<CR>

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>


" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" Disable visualbell
set visualbell t_vb=

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Close window, but not buffer
noremap <leader>c :q<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"*****************************************************************************
""" My stuff
"*****************************************************************************
" F1 displays help, but is too close to F2
nmap <F1> <nop>

" Load any .vimrc located at the git repos root
" (to load project related plugins and settings)
let git_path = system("git rev-parse --show-toplevel 2>/dev/null")
let git_vimrc = substitute(git_path, '\n', '', '') . "/.vimrc.local"
if !empty(glob(git_vimrc))
    exec ":source " . git_vimrc
endif

" highlight current line
set cursorline
set colorcolumn=120
set autoindent
set relativenumber
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Set parens matching so a white bar cursor is still visible
hi MatchParen cterm=bold ctermbg=none ctermfg=blue

" Do not jump briefly when matching parens
set noshowmatch

" Sudo save
cmap w!! w !sudo tee >/dev/null %

" Shows key-combos in lower right corner because of how I type
set showcmd

autocmd CompleteDone * pclose

" Next and previous buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>


if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

