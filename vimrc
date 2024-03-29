call plug#begin('~/.vim/plugged')
"--- Look&Feel ---
Plug 'itchyny/lightline.vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'chriskempson/base16-vim'
"--- Tools ---
Plug 'gcmt/taboo.vim'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'          , {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'claytron/lodgeit-vim'
Plug 'direnv/direnv.vim'
" Plug 'tpope/vim-rsi' " FIXME: breaks with macros
"--- Editing ---
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'            , {'on': 'Tabularize'}
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
"--- Git ---
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'kmarc/vim-fubitive'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"--- TMUX ---
Plug 'jpalardy/vim-slime'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'ferreum/completor-tmux'
Plug 'tmux-plugins/vim-tmux'        , {'for': 'tmux'}
"--- Programming ---
Plug 'andymass/vim-matchup'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'            , {'on': ['TagbarToggle']}
Plug 'maralla/completor.vim'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'janko/vim-test'
Plug 'benmills/vimux'
"--- Markdown, Wiki, Todo ---
Plug 'plasticboy/vim-markdown'      , {'for': 'markdown'}
Plug 'shime/vim-livedown'           , {'for': 'markdown'}
Plug 'freitass/todo.txt-vim'        , {'for': 'todo'}
"--- HTML ---
Plug 'mattn/emmet-vim'              , {'for': ['html', '*jsx']}
Plug 'othree/html5.vim'             , {'for': ['html', '*jsx']}
"--- CSS ---
Plug 'groenewege/vim-less'          , {'for': 'css'}
"--- JavaScript ---
Plug 'moll/vim-node'                , {'for': 'javascript*'}
Plug 'heavenshell/vim-jsdoc'        , {'for': 'javascript*'}
Plug 'othree/yajs.vim'              , {'for': 'javascript*'}
Plug 'pangloss/vim-javascript'      , {'for': 'javascript*'}
"--- React ---
Plug 'mxw/vim-jsx'                  , {'for': '*jsx'}
"--- TypeScript ---
Plug 'leafgarland/typescript-vim'   , {'for': 'typescript*'}
Plug 'maralla/completor-typescript' , {'for': 'typescript*'}
"--- DevOps ---
Plug 'hashivim/vim-terraform'       , {'for': 'terraform'}
Plug 'pearofducks/ansible-vim'
Plug 'andrewstuart/vim-kubernetes'
"--- Dependencies ---
Plug 'tpope/vim-repeat'
Plug 'mattn/webapi-vim'             " for: gist-vim
call plug#end()

syntax on
filetype plugin indent on

set mouse+=a
set ttymouse=xterm2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set nowrap
set linebreak
set backspace=indent,eol,start
set pastetoggle=<F12>
set ignorecase
set smartcase
set incsearch
set hlsearch
set scrolloff=3
set cursorline
set list
let &listchars="trail:\u00b7,tab:\u00bb ,nbsp:\u00b7"
let &showbreak="\u21b5"
set hidden
set wildmenu
set backup
set undofile
set directory=~/.vim/vimswap//
set backupdir=~/.vim/vimbackup//
set undodir=~/.vim/vimundo//
set viminfo+=n~/.vim/misc/viminfo
let s:dir_misc = expand('~/.vim/misc')
set number relativenumber
set colorcolumn=81
set path+=**
set laststatus=2
set wildignore+=*.o,*.so,*.a,*.swp,*.zip,*.pyc,*.class,tags,.git/**,.env/**,__pycache__,build
set wildignore+=.direnv,.mypy_cache
set completeopt=preview,longest,menuone
set splitbelow
set splitright
set diffopt+=vertical   " Always vsplit. Helps with fugitive too
set sessionoptions+=tabpages,globals,localoptions
set switchbuf+=usetab
set wildignorecase
set wildmode=list:full
set wildcharm=<C-z>
set grepprg=rg\ --vimgrep\ $*
set foldlevel=0
set noshowmode
set signcolumn=yes
set shiftwidth=2
set softtabstop=2
set tabstop=2
set tagcase=match

"--- Look & Feel ----
let base16colorspace=256
if has_key(environ(), "TMUX")
  " Set tmux-compatible title
  set t_ts=]2;
  set t_fs=\\
endif

augroup MyColors
  autocmd ColorScheme * highlight Normal   ctermbg=NONE
                    \ | highlight SpellBad ctermbg=19   ctermfg=1   cterm=bold,underline
                    \ | highlight SpellCap ctermbg=19   ctermfg=3   cterm=bold,underline
augroup end
source $HOME/.vim/colorscheme.vim

"--- Mappings ----
cmap w!!                   w !sudo tee > /dev/null %
nnoremap <C-e>             2<C-e>
nnoremap <C-y>             2<C-y>
nnoremap <C-p>             :Files<CR>
nnoremap <expr> <F7>       expand('%') == '' ? ":NERDTreeToggle<CR>" : ":NERDTreeFind<CR>"
nnoremap <space>           :ls<CR>:sbuffer 
nnoremap <leader><space>   :edit **/*.<C-r>=expand('%:e')<return><C-z><C-p><C-u>edit **/*
nnoremap <F8>              :TagbarToggle<CR>
nnoremap <F9>              :lclose<CR>:cclose<CR>:pclose<CR>
nnoremap <leader>fp        :call fzf#vim#files(0, {'options':'--query=' . expand('%:e') . '$\ '})<CR>
nnoremap <leader>fg        :call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case ""',
  \   1, {'options':'--delimiter : --nth 4..'}
  \ )<CR>
nnoremap <leader>fG        :call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ""', 1, {'options':'--delimiter : --nth 4.. --exact --query=<C-r><C-w> +i'})<CR>
nnoremap <leader>ft        :Tags<CR>
nnoremap <leader>fT        :call fzf#vim#tags('^<C-r><C-w> ', {'options':'--exact +i'})<CR>
nnoremap <leader>fb        :Buffers<CR>
nnoremap <leader>fw        :Windows<CR>
nnoremap <leader>w         :call BufferClose()<CR>
nnoremap <leader>W         :call BufferCloseAll()<CR>
nnoremap <leader>z         :call ToggleFold()<CR>
vnoremap <leader>t,        :Tabularize /^[^,]*,/l0l1<CR>
vnoremap <leader>t:        :Tabularize /^[^:]*:/l0l1<CR>
vnoremap <leader>t=        :Tabularize /^[^=]*\zs/l1c1l1<CR>
vnoremap <leader>t<Space>  :Tabularize /\S\+/l1l0<CR>
vnoremap <leader>t<bar>    :Tabularize /<bar>\+/l1c1<CR>
nnoremap <leader>1         1gt
nnoremap <leader>2         2gt
nnoremap <leader>3         3gt
nnoremap <leader>4         4gt
nnoremap <leader>5         5gt
nnoremap <leader>6         6gt
nnoremap <leader>7         7gt
nnoremap <leader>8         8gt
nnoremap <leader>9         9gt
nnoremap <leader>0         0gt
nnoremap <leader>"         :normal ysiW"<CR>
nnoremap <leader>'         :normal ysiW'<CR>
nnoremap <leader>)         :normal ysiW)<CR>
nnoremap <ScrollWheelDown> 2<C-E>
nnoremap <ScrollWheelUp>   2<C-Y>
nnoremap <M-ScrollWheelDown> 4zl
nnoremap <M-ScrollWheelUp>   4zh
nnoremap n                 nzz
nnoremap N                 Nzz
nnoremap [h                :GitGutterPrevHunk<CR>
nnoremap ]h                :GitGutterNextHunk<CR>
nnoremap <leader>aa :!xdg-open https://docs.ansible.com/ansible/latest/list_of_all_modules.html<CR>
nnoremap <leader>am :!xdg-open https://docs.ansible.com/ansible/latest/<C-R><C-W>_module.html\#options<CR>
nnoremap <leader>as :!xdg-open https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html?highlight=<C-R><C-W><CR>
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>

"--- Autocommands ---
augroup vimrc
  autocmd!
  "----- keywordprg
  autocmd FileType vim                            setlocal keywordprg=:help
  autocmd FileType javascript*,typescript*        let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/devdocs.sh " . &l:filetype
  autocmd FileType css,less,scss                  let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/devdocs.sh " . &l:filetype
  autocmd FileType yaml.ansible                   let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/devdocs.sh " . &l:filetype
  autocmd FileType python                         let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/devdocs.sh " . &l:filetype
  autocmd FileType dockerfile                     setlocal keywordprg=:DockerHelp
  autocmd FileType *gotexttmpl,yaml.kubernetes    setlocal keywordprg=:KubeHelp
  "----- mappings
  autocmd FileType markdown                       nnoremap <buffer> <F6> :LivedownToggle<CR>
  autocmd FileType markdown                       nnoremap <buffer> <F8> :Toc<CR><C-w>L<C-w>50<bar>:setlocal winfixwidth<CR>
  autocmd FileType markdown                       setlocal softtabstop=4 tabstop=4 shiftwidth=4
  "----- formatting
  autocmd FileType terraform                      setlocal commentstring=#%s
  autocmd FileType plaintex,text,markdown         setlocal tw=100 colorcolumn=101 formatprg=par\ -jw100
  "----- folding
  autocmd FileType make,dockerfile,yaml,dosini,conf
                                                \ setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*'.&commentstring[0]
  autocmd BufRead,BufNewFile **/tasks/**.y*ml,playbook-*.y*ml
                                                \ setlocal foldmethod=indent foldlevelstart=1 foldnestmax=1
  autocmd FileType python                         setlocal foldmethod=indent foldlevelstart=2 foldnestmax=2 colorcolumn=101 textwidth=100
  "----- filetypes
  autocmd BufRead,BufNewFile Vagrantfile          setlocal filetype=ruby
  autocmd BufRead,BufNewFile *.tsx                setlocal filetype=typescript.jsx
  autocmd BufRead,BufNewFile playbook-*.y*ml      setlocal filetype=yaml.ansible
  autocmd BufRead,BufNewFile .yamllint            setlocal filetype=yaml
  "----- marks
  autocmd BufWritePost *.css,*.less,*.scss        normal! mC
  autocmd BufWritePost *.html                     normal! mH
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx      normal! mJ
  autocmd BufWritePost *.md                       normal! mM
  autocmd BufWritePost *.py                       normal! mP
  autocmd BufWritePost *.sh                       normal! mS
  autocmd BufWritePost *.yml                      normal! mY
  autocmd BufWritePost *.vim,vimrc                normal! mV
  "----- buffer/window opts
  autocmd WinEnter *                              if &l:buftype == "" | setlocal nu   rnu | set   cursorline
  autocmd WinLeave *                              if &l:buftype == "" | setlocal nu nornu | set nocursorline
  autocmd FileType nerdtree                       nnoremap <buffer> <F7> :NERDTreeToggle<CR>
  autocmd FileType help                           wincmd L | 80 wincmd | | setlocal winfixwidth
  autocmd BufReadPost fugitive://*                setlocal bufhidden=delete
  autocmd BufReadPost *.git/index                 setlocal nobuflisted
  "----- startup
  autocmd VimEnter * call CheckProject()
  "----- include/define
  autocmd FileType javascript*,typescript*        setlocal include=from
                                              \ | setlocal define=export.\\{-\\}\\(interface\\\|function\\\|const\\\|type\\\|class\\\|var\\)
  "----- misc
  autocmd BufWritePost ~/Documents/Home/index.md  silent !pandoc --output ~/Documents/Home/index.html
                                                               \ --css github-pandoc.css
                                                               \ --standalone
                                                               \ %
  "----- skeleton
  autocmd BufNewFile *.sh                         0r ~/.vim/skeleton/skeleton.sh
  "----- mail
  autocmd FileType mail                           setlocal formatoptions+=watqc nojoinspaces nosmartindent | match ErrorMsg '\s\+$'
augroup END


"--- Functions --- {{{
let s:fcw=2
function! ToggleFold()
  if &l:foldcolumn == s:fcw
    normal zR
    let &l:foldcolumn = 0
  else
    let &l:foldcolumn = s:fcw
    let &l:foldlevel = 0
  endif
  if &l:foldmethod == 'manual'
    let &l:foldmethod='indent'
  elseif &l:foldmethod == 'indent'
    let &l:foldmethod='manual'
  endif
endfunction

function! BufferClose()
  if &l:buftype != '' || ! &l:buflisted
    quit
  elseif len(getbufinfo({'buflisted':1})) == 1
    bd
  else
    normal 
    bd #
  endif
endfunction

function! BufferCloseAll()
  bufdo if &l:buftype == '' | call BufferClose() | endif
endfunction

let s:sess = fnamemodify($MYVIMRC, ":h") . '/sessions/' . substitute($PWD, '\/', '%', 'g')

function! Project()
  if filereadable(s:sess)
    exec "source" . fnameescape(s:sess)
  else
    exec "Obsession " . fnameescape(s:sess)
  endif
endfunction
command! Project call Project()

function! ProjectDelete()
  exec "Obsession!"
  call delete(s:sess)
endfunction
command! ProjectDelete call ProjectDelete()

function! CheckProject()
  if filereadable(s:sess) && argc() == 0
      call Project()
    endif
endfunction

function! DockerHelp(keyword)
  exec "silent !xdg-open https://docs.docker.com/engine/reference/builder/\\#"
        \ . tolower(a:keyword)
  exec 'redraw!'
endfunction
command! -nargs=1 DockerHelp :call DockerHelp(<f-args>)

function! KubeHelp(keyword)
  let l:versionLine = getline(search('^apiVersion', 'bn'))
  if l:versionLine == ''
    echom 'Cannot find docs (no apiVersion)'
    return
  endif
  let l:path = substitute(l:versionLine, '\v.*apiVersion:\s+([^/ ]+)/([^/ ]+)\s*$', '\2-\1', 'g')
  if l:path == l:versionLine
    let l:path = substitute(l:versionLine, '\v.*apiVersion:\s+([^/ ]+)\s*$', '\1-core', 'g')
  endif
  let l:hash = '\\#' . tolower(a:keyword) . '-' . l:path
  exec 'silent !xdg-open https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.14/'
        \ . l:hash
  exec 'redraw!'
endfunction
command! -nargs=1 KubeHelp :call KubeHelp(<f-args>)
" }}}

"--- Plugin configurations ---
let NERDTreeRespectWildIgnore = 1
let NERDTreeQuitOnOpen = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsListSnippets = "<c-h>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:ale_python_pylint_change_directory = 0
let g:ale_sh_shellcheck_options = '-x'
let g:ale_lint_delay = 2000
let g:completor_completion_delay = 300
let g:delimitMate_expand_cr = 2
let g:fzf_buffers_jump = 1
let g:fzf_files_options = '--exact'
let g:fzf_tags_command = 'git ls-files | ctags -L-'
let g:gist_open_browser_after_post = 1
let g:gutentags_cache_dir = s:dir_misc
let g:jsdoc_enable_es6 = 1
let g:lightline = { 'colorscheme': 'base16', 'component': { 'filename': '%t'} }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
    \ 'left': [ [ 'relativepath' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:netrw_bufsettings = "rnu"
let g:netrw_home = s:dir_misc
let g:netrw_liststyle = 3
let g:slime_paste_file = tempname()
let g:slime_target = "tmux"
let g:taboo_renamed_tab_format =' %N %l%m '
let g:taboo_tab_format = ' %N %f%m '
let g:taboo_modified_tab_flag = '*'
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_type_typescript = {
  \   'ctagstype': 'typescript',
  \   'kinds': [
  \     'I:imports:1',
  \     'n:modules',
  \     'i:interfaces:1',
  \     'e:enums',
  \     'c:classes',
  \     'f:functions:1',
  \     'm:members',
  \     'S:state',
  \     'R:reducer',
  \     'v:variables',
  \     'C:components',
  \     'H:other hooks',
  \   ],
  \   'sro': '.',
  \   'kind2scope': {
  \     'i': 'interface',
  \     'c': 'class',
  \     'C': 'component',
  \     'f': 'function',
  \   },
  \   'scope2kind': {
  \     'interface': 'i',
  \     'class':    'c',
  \     'component': 'C',
  \     'variable': 'v',
  \     'function': 'f',
  \     'state': 'S',
  \   },
  \   'deffile': '~/.ctags.d/typescript.ctags'
  \ }
let g:tagbar_type_jsx = g:tagbar_type_typescript
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let test#strategy = 'vimux'
augroup test
  autocmd!
  autocmd BufWrite * if test#exists() |
    \   TestFile |
    \ endif
augroup END

set modeline
set exrc
set secure

silent! source ~/.pdotfiles/vim/vimrc

" vim: fdm=marker fdl=0 fen
