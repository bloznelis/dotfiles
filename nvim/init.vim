" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim
" General settings
" ---------------------------------------------------------------------------
"

" Fix colorscheme
set termguicolors

" Enable mouse support
set mouse=a

" Use spaces instead of tabs
set expandtab

" Make tabs smarter
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start

" don't create `filename~` backups
set nobackup

" don't create temp files
set noswapfile

" line numbers and distances
set relativenumber 
set number 

" number of lines offset when jumping
set scrolloff=20

" Indent new line the same as the preceding line
set autoindent

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" open new buffers without saving current modifications (buffer remains open)
set hidden

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

" CursorLine - sometimes autocmds are not performant; turn off if so
" http://vim.wikia.com/wiki/Highlight_current_line
set cursorline

" Don't start new lines with comment symbol
set formatoptions-=cro

" Directory is always the same as the file you are editing
set autochdir


"Delete instead of cut in visual mode when pressing d"
nnoremap d "_d
vnoremap d "_d


let g:ycm_filetype_blacklist = {
      \ 'scala': 1,
      \}

call plug#begin('~/.config/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colors
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'overcache/NeoSolarized'

call plug#end()

" Set colorscheme
set background=light
colorscheme NeoSolarized

" Disable fzf preview
let g:fzf_preview_window = []

" Key bindings
" ---------------------------------------------------------
let mapleader = "\<space>"

nmap          <Leader>vr :source $MYVIMRC<cr>
nmap <silent> <Leader>ve :e $MYVIMRC<cr>
nmap <silent> <Leader>f  :Files<cr>
nmap <silent> <Leader>gf :GFiles<cr>
nmap <silent> <Leader>b  :Buffers<cr>

nmap <silent> <Leader>tl :tabnext<cr>
nmap <silent> <Leader>th :tabprevious<cr>
nmap <silent> <Leader>tn :tabnew<cr>
nmap <silent> <Leader>tq :tabclose<cr>

nmap <silent> <Leader>q  :q<cr>
" ---------------------------------------------------------

nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :Files<CR>
nmap <F8> :GFiles<CR>

let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]

" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Make new window
nmap <C-a> :vsplit<CR>
nmap <C-s> :split<CR>

" Colors
" ---------------------------------------------------------------------------
syntax enable
filetype plugin indent on
" ---------------------------------------------------------------------------

" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
