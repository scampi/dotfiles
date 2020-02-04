" https://github.com/dan-t/rusty-tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi

au FileType javascript setl colorcolumn=140
set noshowmode
set t_Co=256
set runtimepath=/usr/share/vim/vimfiles,~/.config/nvim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.config/nvim/after,$GOPATH/src/github.com/golang/lint/misc/vim

autocmd FileType mail :nmap <F8> :w<CR>:!aspell -e -c %<CR>:e<CR>

augroup filetype
	""au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.config/nvim/syntax/jflex.vim

" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc

set nocompatible " use vim defaults
set scrolloff=3 " keep 3 lines when scrolling
set autoindent

set mouse=a
set relativenumber
set cindent
set smartindent
set cinkeys=0{,0},:,0#
set pastetoggle=<F2>
set clipboard+=unnamedplus

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set showcmd " display incomplete commands
set nobackup " do not keep a backup file
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

set t_RV= " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

filetype off
" initialize dein, plugins are installed to this directory
call dein#begin(expand('~/.cache/dein'))

call dein#add('dyng/dejava.vim')

call dein#add('rking/ag.vim')
let g:ag_prg = 'ag --vimgrep'

call dein#add('mustache/vim-mustache-handlebars')

call dein#add('troydm/zoomwintab.vim')

call dein#add('GEverding/vim-hocon')

call dein#add('tpope/vim-fugitive')
nmap <A-b> :Gblame<CR>

call dein#add('scrooloose/nerdtree')
map <F3> :NERDTreeToggle<CR>
call dein#add('scrooloose/nerdcommenter')

call dein#add('altercation/vim-colors-solarized')

" not needed in neovim: https://github.com/neovim/neovim/issues/5438#issuecomment-251923628
" call dein#add('tpope/vim-sensible')

call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')

call dein#add('dzeban/vim-log-syntax')
let g:vim_markdown_math=0

call dein#add('itchyny/calendar.vim')
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

call dein#add('gf3/peg.vim')

call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory="~/.config/nvim/snippets"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" Track the engine.
"call dein#add('SirVer/ultisnips')

"" Snippets are separated from the engine. Add this if you want them:
"" Plugin 'honza/vim-snippets'

"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
"let g:UltiSnipsExpandTrigger="<c-e>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"let g:UltiSnipsUsePythonVersion = 3
let g:loaded_python_provider = 1
let g:python_host_skip_check=1
let g:python3_host_skip_check=1

call dein#add('elzr/vim-json')

call dein#add('Yggdroot/indentLine')
" https://github.com/elzr/vim-json/issues/23#issuecomment-40293049
let g:indentLine_noConcealCursor=""
" https://github.com/Yggdroot/indentLine/issues/48
let g:indentLine_faster = 1

call dein#add('nono/vim-handlebars')
call dein#add('digitaltoad/vim-jade')

call dein#add('vim-scripts/awk.vim')

call dein#add('scrooloose/syntastic')

call dein#add('felipec/notmuch-vim')

call dein#add('vimwiki/vimwiki')
let g:vimwiki_list = [{'path': '~/documents/wiki/'}]

" call dein#add('itchyny/lightline.vim')
" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head'
"       \ },
"       \ }
call dein#add('bling/vim-airline')
let g:airline_powerline_fonts = 1
let g:airline#extensions#eclim#enabled = 0
" Status line setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

call dein#add('lervag/vimtex')

call dein#add('editorconfig/editorconfig-vim')
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

call dein#add('mhinz/vim-signify')

call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')
let g:racer_experimental_completer = 1
let g:racer_cmd = "/home/yfful/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/racer"
"/usr/bin/racer"
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustfmt'
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
set hidden
"let $RUST_SRC_PATH="/usr/src/rust/src/"

call dein#add('autozimu/LanguageClient-neovim', {
    \ 'on_ft': 'rust',
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_devel = 1 " Use rust debug build
let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
let g:LanguageClient_loggingFile = '/tmp/rls.log'
let g:LanguageClient_serverCommands = { 'rust': ['rustup', 'run', 'nightly', 'rls'] }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

call dein#add('/usr/share/vim/vimfiles/plugin/fzf.vim')
call dein#add('junegunn/fzf.vim')

call dein#add('cespare/vim-toml')

call dein#add('vito-c/jq.vim')

call dein#add('isRuslan/vim-es6')
call dein#add('pangloss/vim-javascript')
let g:javascript_plugin_jsdoc = 1
set conceallevel=0

call dein#add('tpope/vim-obsession')

call dein#add('ctrlpvim/ctrlp.vim')
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]node_modules$',
  \ }

call dein#add('heavenshell/vim-jsdoc')
let g:jsdoc_underscore_private = 1
let g:jsdoc_enable_es6 = 1

call dein#add('elixir-lang/vim-elixir')

call dein#add('vim-scripts/Tabmerge')

call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1

call dein#add('Shougo/denite.nvim')

" autocompletion for javascript
" https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
call dein#add('ternjs/tern_for_vim', { 'on_ft': ['javascript', 'javascript.jsx'], 'build' : 'npm install' })
call dein#add('carlitux/deoplete-ternjs', { 'on_ft': ['javascript', 'javascript.jsx'] })
call dein#add('othree/jspc.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview

" call dein#add('leafgarland/typescript-vim')
" let g:typescript_indent_disable = 0

call dein#add('tpope/vim-unimpaired')

call dein#add('sakhnik/nvim-gdb')

call dein#add('vim-scripts/loremipsum')

call dein#add('raghur/vim-ghost', {'build': ':GhostInstall'})

call dein#add('junegunn/goyo.vim', {'build': ':PlugInstall'})

call dein#add('landaire/deoplete-d')

" exit dein
call dein#end()
" auto-install missing packages on startup
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on

set background=dark
au VimEnter * colorscheme solarized

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
 let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
       \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
 let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
 call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Fold on search: http://vim.wikia.com/wiki/Folding_with_Regular_Expression
nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

" terminal navigation
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" quick save
noremap <C-s> :update<CR>

" copy path to file
noremap <silent> <F4> :let @+=expand("%:p")<CR> 

" Search for visually selected text: http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>

" Skeletons
if has("autocmd")
  augroup templates
    autocmd BufNewFile story.md 0r ~/.config/nvim/templates/skeleton-GH-story.md
  augroup END
endif
