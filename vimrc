" Enviroment {
    " Basics {

        set nocompatible
        filetype off

        set textwidth=80
        set colorcolumn=+1
    " }

    " Setup Bundle Support {
    " The next two lines ensure that the ~/.vim/bundle/ system works
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
    " }
" }

" Bundles {
    " Deps

        Bundle 'gmarik/vundle'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Bundle 'mileszs/ack.vim'
        elseif executable('ack')
            Bundle 'mileszs/ack.vim'
        endif

    " General
        Bundle 'scrooloose/nerdtree'
        Bundle 'Lokaltog/vim-powerline'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'matchit.zip'
        Bundle 'nathanaelkane/vim-indent-guides'

    " Cores
        Bundle 'spf13/vim-colors'
        Bundle 'flazz/vim-colorschemes'
        Bundle 'shinzui/vim-idleFingers'
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'nanotech/jellybeans.vim'

    " General Programming
        Bundle 'scrooloose/syntastic'
        Bundle 'garbas/vim-snipmate'
        Bundle 'honza/vim-snippets'
        Bundle 'tpope/vim-fugitive'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'godlygeek/tabular'
        Bundle 'majutsushi/tagbar'
        Bundle 'spf13/snipmate-snippets'
        Bundle 'tpope/vim-fugitive'
        Bundle 'Shougo/neocomplcache'
        Bundle 'kien/ctrlp.vim'
        Bundle 'tpope/vim-surround'


    " Python
        " Pick either python-mode or pyflakes & pydoc
        Bundle 'klen/python-mode'
        Bundle 'python.vim'
        Bundle 'python_match.vim'
        Bundle 'pythoncomplete'

    " Javascript
        Bundle 'leshill/vim-json'
        Bundle 'groenewege/vim-less'
        Bundle 'taxilian/vim-web-indent'

    " HTML
        Bundle 'HTML-AutoCloseTag'
        Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'

    " Misc
        Bundle 'spf13/vim-markdown'
        Bundle 'tpope/vim-cucumber'
        Bundle 'Puppet-Syntax-Highlighting'
        Bundle 'mattn/pastebin-vim'

" }

" General {
    set background=dark         " Assume a dark background
    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    "set mouse=a                 " automatically enable mouse usage
    scriptencoding utf-8
    set fileencodings=utf-8
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " always switch to the current file directory.

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set spell                       " spell checking on
    set hidden                      " allow buffer switching without saving

    " Setting up the directories {
        set backup                      " backups are nice ...
        if has('persistent_undo')
            set undofile                "so is persistent undo ...
            set undolevels=1000         "maximum number of changes that can be undone
            set undoreload=10000        "maximum number lines to save for undo on a buffer reload
        endif
        " Could use * rather than *.*, but I prefer to leave .files unsaved
        au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
        au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }
" }

" Vim UI {
    let g:pastebin_api_dev_key = "764eb01a9d609190a0ac25dab80f1d9c"
    let g:pastebin_api_user_name = "wsantos"
    let g:pastebin_api_user_password = "dany22"
    color jellybeans
    "color solarized                 " load a colorscheme
        "let g:solarized_termtrans=1
        "let g:solarized_termcolors=256
        "let g:solarized_contrast="high"
        "let g:solarized_visibility="high"
    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    set cursorline                  " highlight current line

    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code
    set wildignore=*.swp,*.bak,*.pyc,*.class
    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
    set nobackup
    set noswapfile


" }

" Formatting {
    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=4                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    "set matchpairs+=<:>                " match, to be used with % 
    set pastetoggle=<F2>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " The following two lines conflict with moving to top and bottom of the
    " screen
    " If you prefer that functionality, comment them out.
    map <S-H> gT
    map <S-L> gt

    " Stupid shift key fixes
    cmap W w
    cmap WQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    """ Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    "clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv 

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=
" }

" Plugins {
    " ctrlp {
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.*~,*.pyc
    " }

    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

    " vim-powerline {
        let g:Powerline_symbols = 'compatible'
    "
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " EasyTags {
        let g:easytags_cmd = 'ctags'
    " }

    " SnipMate {
        " Setting the author var
        " If forking, please overwrite in your .vimrc.local file
        let g:snips_author = 'Steve Francia <steve.francia@gmail.com>'
        " Shortcut for reloading snippets, useful when developing
        nnoremap ,smr <esc>:exec ReloadAllSnippets()<cr>
    " }

    " NerdTree {
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }

     " JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
     " }

     " PyMode {
        let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
        let g:pymode_folding = 0
        let g:pymode_lint_cwindow = 0
        let g:pymode_lint_hold = 0
     " }

     " TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
     "}

     " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
     "}

     " neocomplcache {
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_enable_auto_delimiter = 1

        " AutoComplPop like behavior.
        let g:neocomplcache_enable_auto_select = 1

        " SuperTab like snippets behavior.
        imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " Plugin key-mappings.
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neocomplcache_snippets_expand)
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()


        " <CR>: close popup 
        " <s-CR>: close popup and save indent.
        inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>" 
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

     " }

" }


"if &term =~ "xterm"
    ""256 color --
    "let &t_Co=256
    "" restore screen after quitting
    "set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
    "if has("terminfo")
        "let &t_Sf="\ESC[3%p1%dm"
        "let &t_Sb="\ESC[4%p1%dm"
    "else
        "let &t_Sf="\ESC[3%dm"
        "let &t_Sb="\ESC[4%dm"
    "endif
"endif


" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif



