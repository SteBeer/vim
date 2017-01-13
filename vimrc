call plug#begin('~/.vim/plugged')
"--- Tools ---
Plug 'junegunn/fzf'             , {'dir': '~/.fzf', 'frozen': 1 }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'romainl/vim-qf'
Plug 'scrooloose/nerdtree'      , {'on': 'NERDTreeToggle' }
Plug 'tpope/vim-unimpaired'
"--- Git ---
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-fugitive'
"--- TMUX ---
Plug 'jpalardy/vim-slime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
"--- Filetype helpers ---
Plug 'nblock/vim-dokuwiki'
Plug 'jceb/vim-orgmode'                 , {'for': 'org'}
"--- Editing ---
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'                , {'on': 'Tabularize'}
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
"--- Look&Feel ---
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"--- Programming ---
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'           , {'do':  './install.sh'}
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
"--- Markdown ---
Plug 'plasticboy/vim-markdown'  , {'for': 'markdown'}
Plug 'shime/vim-livedown'       , {'for': 'markdown'}
"--- HTML ---
Plug 'mattn/emmet-vim'          , {'for': 'html'}
Plug 'othree/html5.vim'         , {'for': 'html'}
"--- CSS ---
Plug 'ap/vim-css-color'         , {'for': 'css'}
Plug 'groenewege/vim-less'      , {'for': 'css'}
"--- Dependencies
Plug 'tpope/vim-repeat'

" "--- JavaScript ---
" Plug 'moll/vim-node'
" Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'flowtype/vim-flow'
" "--- C/C++ ---
" Plug 'vim-scripts/a.vim'                  , {'for': ['cpp', 'c'] }
" Plug 'octol/vim-cpp-enhanced-highlight'   , {'for': ['cpp', 'c'] }
" Plug 'rdnetto/YCM-Generator'              , {'for': ['cpp', 'c'], 'branch': 'stable'}
" "--- Haskell ---
" Plug 'eagletmt/ghcmod-vim'    , {'for': 'haskell'}
" Plug 'eagletmt/neco-ghc'      , {'for': 'haskell'}
" Plug 'raichoo/haskell-vim'    , {'for': 'haskell'}
" Plug 'Twinside/vim-hoogle'    , {'for': 'haskell'}
call plug#end()

runtime macros/matchit.vim

syntax on
filetype plugin indent on

set nocompatible
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set smartindent
set nowrap
set linebreak
set showbreak=↵
set pastetoggle=<F12>
set ignorecase
set smartcase
set incsearch
set hlsearch
set scrolloff=3
set cursorline
set list
set listchars=trail:·,tab:»\ "
set hidden
set wildmenu
set backup
set undofile
set directory=~/.vim/vimswap//
set backupdir=~/.vim/vimbackup//
set undodir=~/.vim/vimundo//
set viminfo+=n~/.vim/misc/viminfo
set number relativenumber
set path+=**
set laststatus=2
set wildignore+=*.o,*.so,*.a,*.swp,*.zip,*.pyc,tags,.git/**,.env/**
set completeopt=preview,longest,menuone
set splitright
set diffopt+=vertical   " Always vsplit. Helps with fugitive too
set colorcolumn=81

"--- Look & Feel ----
set background=dark
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    silent! source ~/.vimrc_background
endif

"--- Mappings ----
cmap w!!                   w !sudo tee > /dev/null %
nmap <leader>1             <Plug>AirlineSelectTab1
nmap <leader>2             <Plug>AirlineSelectTab2
nmap <leader>3             <Plug>AirlineSelectTab3
nmap <leader>4             <Plug>AirlineSelectTab4
nmap <leader>5             <Plug>AirlineSelectTab5
nmap <leader>6             <Plug>AirlineSelectTab6
nmap <leader>7             <Plug>AirlineSelectTab7
nmap <leader>8             <Plug>AirlineSelectTab8
nmap <leader>9             <Plug>AirlineSelectTab9
nnoremap <C-e>             2<C-E>
nnoremap <C-y>             2<C-y>
nnoremap <C-p>             :Files<CR>
nnoremap <F7>              :NERDTreeToggle<CR>
nnoremap <F8>              :TagbarToggle<CR>
nnoremap <F9>              :lclose<CR>:cclose<CR>
nnoremap <leader>W         :bufdo bd<CR>
nnoremap <leader>w         :bp<CR>:bd #<CR>
nnoremap <leader>f         :call ToggleFold()<CR>
nnoremap <leader>t:        Vap:Tabularize /:\zs/l0l1<CR>
nnoremap <leader>t<Space>  Vap:Tabularize /\S\+/l1l0<CR>
nnoremap <leader>t=        Vap:Tabularize /=\+/l1c1<CR>
nnoremap <leader>t<bar>    Vap:Tabularize /<bar>\+/l1c1<CR>
nnoremap <ScrollWheelDown> 2<C-E>
nnoremap <ScrollWheelUp>   2<C-Y>
nnoremap <s-tab>           :bp<CR>
nnoremap <tab>             :bn<CR>
nnoremap N                 Nzz
nnoremap n                 nzz
nnoremap [h                :GitGutterPrevHunk<CR>
nnoremap ]h                :GitGutterNextHunk<CR>
nnoremap <leader>a         :call fzf#vim#grep('ag --<C-r>=&l:filetype<CR> --nogroup --column --color "(?=.)"', 1)<CR>
nnoremap <leader>A         :call fzf#vim#grep('ag --<C-r>=&l:filetype<CR> --nogroup --column --color "(?=<C-r><C-w>)"', 1)<CR>

"--- Autocommands ---
autocmd WinLeave *                            if &buftype == "" | setlocal nu nornu | endif
autocmd WinEnter *                            if &buftype == "" | setlocal nu rnu | endif
autocmd FileType vim                          nnoremap <buffer> K :help <C-R><C-W><CR>
autocmd FileType markdown                     nnoremap <buffer> <F6> :LivedownToggle<CR>
autocmd FileType markdown                     nnoremap <buffer> <F8> :Toc<CR>
autocmd FileType c,cpp,python,javascript*     nnoremap <buffer> <Leader>] :YcmCompleter GoTo<CR>
autocmd BufRead Vagrantfile                   setlocal filetype=ruby
autocmd FileType javascript*                  setlocal sw=2 sts=2 ts=2
autocmd FileType plaintex,text,markdown       setlocal tw=80
autocmd VimResized */doc/*                    wincmd L | 80 wincmd | | set winfixwidth
autocmd BufRead,BufEnter */doc/*              wincmd L | 80 wincmd | | set winfixwidth
autocmd VimLeave,BufLeave,BufUnload *.css,*.less,*.scss normal! mC
autocmd VimLeave,BufLeave,BufUnload *.html              normal! mH
autocmd VimLeave,BufLeave,BufUnload *.js,*.jsx,*.ts     normal! mJ
autocmd VimLeave,BufLeave,BufUnload *.md                normal! mM
autocmd VimLeave,BufLeave,BufUnload *.py                normal! mP
autocmd VimLeave,BufLeave,BufUnload *.sh                normal! mS
autocmd VimLeave,BufLeave,BufUnload *.vim,vimrc         normal! mV

"--- Functions ---
function! ToggleFold()
    if &l:foldmethod == "manual"
        let &l:foldmethod='indent'
        let &l:foldcolumn=&l:tabstop
    else
        let &l:foldmethod='manual'
        let &l:foldcolumn=0
        normal zE
    endif
endfunction

"--- Plugin configurations ---

"--- delimitMate ---
let delimitMate_expand_cr = 1

"--- editorconfig-vim ---
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"--- flow ---
let g:flow#enable = 0

"--- fugitive.vim ---
autocmd BufReadPost fugitive://* set bufhidden=delete

"--- fugitive-gitlab.vim ---
let g:fugitive_gitlab_domains = [
    \ 'http://gitlab.zurich.ibm.com'
\ ]

"--- nerdtree ---
autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeRespectWildIgnore = 1

"--- netrw ---
let g:netrw_home=expand("~/.vim/misc")
let g:netrw_liststyle=3

"--- vim-slime ---
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_paste_file = tempname()

" "--- orgmode ---
" let g:org_heading_shade_leading_stars = 0
" let g:org_indent = 1

"--- tagbar ---
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1

"--- vim-airline ---
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0

"--- vim-markdown ---
let g:vim_markdown_folding_disabled=1

"--- vim-gitgutter ---
let g:gitgutter_max_signs=2000

" "--- YouCompleteMe ---
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:EclimCompletionMethod = 'omnifunc'
" let g:ycm_semantic_triggers = {'haskell' : ['.'], 'typescript' : ['.'], 'javascript': ['.']}
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_filetype_blacklist = {}

"--- UltiSnips ---
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-h>"
let g:UltiSnipsSnippetDirectories=["plugged/vim-snippets/UltiSnips","UltiSnips"]

set modeline
set exrc
set secure
