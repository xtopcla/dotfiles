set nocompatible

let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    Bundle 'gmarik/vundle'

    Bundle 'tpope/vim-fugitive'
    Bundle 'klen/python-mode'
    Bundle 'kien/ctrlp.vim'
    Bundle 'scrooloose/nerdtree'
    Bundle 'Lokaltog/powerline'
    Bundle 'tpope/vim-surround'
    Bundle 'nanotech/jellybeans.vim'
    Bundle 'altercation/vim-colors-solarized'
    "node.js dependency
    Bundle "wookiehangover/jshint.vim"

set showmode
set showcmd

set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set pastetoggle=<F2>
set number

set colorcolumn=80

set nohlsearch
set incsearch
set ignorecase
set smartcase

set cmdheight=2
set laststatus=2

set title
set titleold=""

set nobackup
set noswapfile

set dictionary=/usr/share/dict/words

set display=lastline

set wildmenu
set wildmode=longest:full,list:full
set wildignore+=*.o,*~,*.lo,*.swp,*.pyc,*.class
set suffixes+=.in,.a
set wildchar=<TAB>

set foldmethod=indent
set foldlevel=99

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

set completeopt=longest,menuone,preview

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

let mapleader = ","

nmap <Leader>l :setlocal number!<CR>
nmap <Leader>e :NERDTreeToggle<CR>

hi LineNr cterm=bold ctermfg=DarkGrey
hi Pmenu ctermbg=blue
hi Search ctermbg=208 ctermfg=124
hi ColorColumn guibg=#2c2d27 ctermbg=235

let &colorcolumn="80,".join(range(120,999),",")

"match Todo /\s\+$/

filetype plugin indent on

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
end

"color jellybeans
set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" Return to last edit position on opening a file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" NERDTree settings
let g:NERDTreeHijackNetrw=0
let g:NERDTreeIgnore=['\.swp$', '\.pyc$', '\~$', '\.class$']
let g:NERDTreeWinSize=40

" CtrlP settings
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0


" Python-mode settings
"Linting
let g:pymode_lint_ignore = "E501"
let g:pymode_lint = 1
let g:pymode_lint_checker = ["pyflakes", "pep8"]
let g:pymode_lint_cwindow = 0
let g:pymode_trim_whitespaces = 1

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Rope settings
let g:pymode_rope = 1
let g:pymode_rope_goto_def_newwin = "new"
let g:pymode_rope_goto_definition_bind = '<Leader>j'

" autocomplete
let g:pymode_rope_completion = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

let @p="oimport pdb; pdb.set_trace()"

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
