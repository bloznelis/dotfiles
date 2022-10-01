" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc

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

call plug#begin('~/.config/nvim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Colors
Plug 'overcache/NeoSolarized'

call plug#end()

" Set colorscheme
set background=light
colorscheme NeoSolarized

" Key bindings
" ---------------------------------------------------------
let mapleader = "\<space>"

nmap          <Leader>vr :source $MYVIMRC<cr>
nmap <silent> <Leader>ve :e $MYVIMRC<cr>
nmap <silent> <Leader>ff <cmd>Telescope find_files<cr>
nmap <silent> <Leader>f/ <cmd>Telescope live_grep<cr>
nmap <silent> <Leader>fg <cmd>Telescope git_files<cr>
nmap <silent> <Leader>fb <cmd>Telescope buffers<cr>
nmap <silent> <Leader>fh <cmd>Telescope help_tags<cr>

nmap <silent> <Leader>tl :tabnext<cr>
nmap <silent> <Leader>tp :tabprevious<cr>
nmap <silent> <Leader>tn :tabnext<cr>
nmap <silent> <Leader>tt :tabnew<cr>
nmap <silent> <Leader>tq :tabclose<cr>

nmap <silent> <Leader>q  :q<cr>
" ---------------------------------------------------------

nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :Files<CR>
nmap <F8> :GFiles<CR>

let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]

" Splits
nmap <silent> <Leader>wv :vsplit<cr>
nmap <silent> <Leader>ws :split<cr>
nmap <silent> <Leader>wh <C-w>h<cr>
nmap <silent> <Leader>wl <C-w>l<cr>
nmap <silent> <Leader>wk <C-w>k<cr>
nmap <silent> <Leader>wj <C-w>j<cr>
nmap <silent> <Leader>wc :close<cr>

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Colors
" ---------------------------------------------------------------------------
syntax enable
filetype plugin indent on
" ---------------------------------------------------------------------------

" Update git gutter on write
autocmd BufWritePost * GitGutter

" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
