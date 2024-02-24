call plug#begin('~/.vim/plugged')

" java decompiler with procyon
Plug 'dyng/dejava.vim'

Plug 'tpope/vim-commentary'

Plug 'vimwiki/vimwiki', {'branch': 'dev'}
let g:vimwiki_list = [{'path': '~/Nextcloud/Notes/'}]

Plug 'tpope/vim-unimpaired'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate java' }

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-signify'

Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-fugitive'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

set nocompatible
set scrolloff=3
set autoindent
set mouse=a
set relativenumber
set cindent
set smartindent
set clipboard+=unnamedplus
set number " show line numbers
set ruler " show the current row and column
set inccommand=nosplit " NEOVIM: live substitute
set hlsearch " highlight searches
set incsearch " do incremental searching
set showmatch " jump to matches when entering regexp
set ignorecase " ignore case when searching
set smartcase " no ignorecase if Uppercase char present
set visualbell t_vb= " turn off error beep/flash
set novisualbell " turn off visual bell
set noshowmode

filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized
au VimEnter * colorscheme solarized

source $HOME/.config/nvim/plug-config/coc.vim

nmap <leader>f :Files<cr>
