" Comments lead with a double quote
" turn on mouse for all modes
set mouse=a
set clipboard=unnamed
set hlsearch
set backspace=indent,eol,start " backspace will delete anything
set undofile     " creates an undo file so you can undo after closing and reopening a file
set title " change the title of the terminal window to the file being edited
set nobackup            " do not create a backup (we are using the undo file)
set noswapfile          " do not create a swapfile
" navigate wrapped lines as if they were wrapped
nnoremap j gj
nnoremap k gk
" faster command entry
nnoremap ; :
let mapleader=","
"
" set complete=t " only complete tags instead of buffer, and stuff, makes ctrl-p/n usable
set complete=.,i,t      " scan current file, included files (super classes and interfaces), and then ctags
set pumheight=7
set completeopt=longest,menuone,preview " show only matches so far, and show menu even if only one choice

" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set expandtab " expand tabs into spaces as you come across them
set tabstop=4 " use 4 spaces for tabs
set shiftwidth=4 " when indenting, use multiple of 4 spaces
set shiftround " round off indenting to multiples of shiftwidth
set copyindent " new lines inherit the current indent (and maybe contextual, not sure)
set softtabstop=4 " backspace over space indentation will delete the indendation
set smarttab

filetype plugin indent on " load java/c/etc. standard plugin and indentation rules
set autoread " automatically re-read files that have changed
autocmd CursorHold,CursorHoldI * checktime " if user pauses typing for 'updatetime' seconds (4), check for file modification

" Allow left/right movement keys to "wrap" to the previous/next line.
" b - backspace key
" s - space key
" [ - left arrow  (insert and replace modes)
" ] - right arrow (insert and replace modes)
set whichwrap=b,s,[,]
set nostartofline " on large scale navigation, do not move to beginning of line

set wrapscan " wrap around buffer when searching
set incsearch " incremental searching - works well with highlighting
set ignorecase " do not match case
set smartcase " if you do type upper case anywhere, then it is case sensitive
"
" ignore these files for completion
set wildignore=*.swp,*.bak,*.class,*.o,*.jar,*.gif,*.jpg,*.png,*.bmp,*.svn-base,*/svn/*


" use tabs/windows keep those edited buffers around
set hidden " can hide buffers even if there is an edit
set tag=./tags;$HOME,tags,$HOME " stop search above home directory


function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


" TAGBAR configuration
" --------------------
" map F8 to open/close the tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_singleclick = 1
let g:ctrlp_max_files = 40000 " default only 10000 though this takes a while to process
" open tabgar if file type supports it
"autocmd VimEnter * nested :call tagbar#autoopen(1)
" open tagbar on supported file types for new editors within vim
"autocmd FileType * nested :call tagbar#autoopen(0)
" open tagbar with new tab for supported file type, might be disabled because over aggressive? I forgot
" :autocmd BufEnter * nested :call tagbar#autoopen(0)

set printoptions=paper:letter,duplex:off " Setup print options for hardcopy command.
set showcmd " some extra info about the currnt command at the last line of screen


" always show the powerline, and use unicode symbols
set laststatus=2

" tagbar configuration if you install it
" ---------------------------------------
" one mouse click navigates
let g:tagbar_singleclick = 1



" ----- NERDTREE ---------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
silent! map <F2> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F2>"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.class$', '\~$']
" need this off to use netrw which is the only way to get VCSCommand to work across directories
let NERDTreeHijackNetrw=0
" ------------------------


let g:EclimSignLevel=2 " only mark errors instead of a bazillion warnings
nmap <F3> :JavaSearchContext<CR>
let g:EclimCompletionMethod='omnifunc'   " also required for eclim to work

let g:ctrlp_follow_symlinks = 1 " follow symlinks but avoid loops
let g:ctrlp_max_files = 40000 " default only 10000

map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

hi MBENormal               ctermbg=black ctermfg=white
hi MBEChanged              ctermbg=black ctermfg=yellow
hi MBEVisibleNormal        ctermbg=black ctermfg=white cterm=bold
hi MBEVisibleChanged       ctermbg=black ctermfg=yellow cterm=bold
hi MBEVisibleActiveNormal  ctermbg=white ctermfg=black cterm=bold
hi MBEVisibleActiveChanged ctermbg=yellow ctermfg=black cterm=bold

au BufNewFile,BufRead *.ad setlocal ft=asciidoc

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1

let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_args = "--fast --disable=errcheck"

let g:indent_guides_enable_on_vim_startup = 1

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

"dein Scripts-----------------------------
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    
    " For autocomplete
    call dein#add('Shougo/deoplete.nvim')
    " python plugin for deoplete
    call dein#add('deoplete-plugins/deoplete-jedi')
    " ocaml plugin for deoplete
    call dein#add('copy/deoplete-ocaml')
    " golang plugin for deoplete
    call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})

    call dein#add('fatih/vim-go')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('majutsushi/tagbar')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('scrooloose/nerdtree')
    call dein#add('iCyMind/NeoSolarized')

    " ale is code linter and fixer
    " for python support: pip3 install --user autopep8 pylint yapf
    call dein#add('w0rp/ale')
    " do all completions just with tab
    call dein#add('ervandew/supertab')

    " You can specify revision/branch/tag.
    "call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

    " Required:
    call dein#end()
    call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------
"

" do not worry about vi compatibility
set nocompatible

set encoding=utf-8 " Necessary to show Unicode glyphs

" turn on color highlighting
let python_highlight_all=1
syntax enable
" turn on relative line numbering
"set relativenumber
" turn on line numbers
set number

set background=dark " solarized dark background
colorscheme NeoSolarized " solarized color scheme
set termguicolors

let g:deoplete#enable_at_startup = 1

let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

let g:SuperTabDefaultCompletionType = "<c-n>"

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:python3_host_prog = 'python3'

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF
