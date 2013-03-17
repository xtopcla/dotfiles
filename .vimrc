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

    Bundle 'pangloss/vim-javascript'
    Bundle 'vim-scripts/jQuery'
    Bundle 'tpope/vim-fugitive'
    Bundle 'scrooloose/syntastic'
    Bundle 'kien/ctrlp.vim'
    Bundle 'scrooloose/nerdtree'
    Bundle 'Lokaltog/powerline'

set showmode
set showcmd

set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set pastetoggle=<F2>
set number

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

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

let mapleader = ","

nmap <Leader>l :setlocal number!<CR>
nmap <Leader>e :NERDTreeToggle<CR>

" NERDTree settings
let g:NERDTreeHijackNetrw=0
let g:NERDTreeIgnore=['\.swp$', '\.pyc$', '\~$', '\.class$']
let g:NERDTreeWinSize=40

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

hi LineNr cterm=bold ctermfg=DarkGrey

match Todo /\s\+$/

highlight Search ctermbg=208 ctermfg=124

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
end

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" Return to last edit position on opening a file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

let g:syntastic_python_checker = "flake8"
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_mode_map = {'mode': 'active',
                           \ 'active_filetypes': ['py'],
                           \ 'passive_filetypes': ['html', 'js'] }
