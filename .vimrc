set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'scrooloose/syntastic' " Slows down vim
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
call vundle#end()

" Colors
set background=dark
colorscheme solarized
syntax enable " enable allows syntax highlighting, 'on' overwrites your settings and uses default

" Everything
filetype plugin indent on " Languade dependent indenting
" The Esc key is just so far
inoremap jk <esc>
inoremap kj <esc>
" yy already yanks the whole line. Y should yank from cursor to end of line (like D & C)
nnoremap Y y$
set smartindent " Smartly maintains indent level
set showcmd " Show the command being executed
set tabstop=2 " Tab is two spaces
set shiftwidth=2 " Indent is two spaces
set expandtab " Switch tabs to spaces
set number " Show line numbers
set ruler " Show cursor position
set backup " Automatic backups
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set noerrorbells " No error bells
" Disabling the next two cursor settings as they down scrolling
" set cursorline " Highlight the current line
" set cursorcolumn " Highlight the current column
set laststatus=2 " Always show status line
set mouse=nv " Mouse to work only in normal & visual modes
set title " Automatically change window title based on currently opened file
set ignorecase " Ignore case when searching with just lowercase
set smartcase " But, don't ignore case when there's even a single uppercase letter in the search text
set encoding=utf-8 " Default encoding utf-8
set completeopt+=longest,menuone " Make completion menu work like in IDE
set incsearch " Automatically move cursor to search matches
set hlsearch " Highlight all search matches
" Switch off highlight for current search on pressing enter
nnoremap <silent> <CR> :nohlsearch<CR>
set autowrite " Write file when focus is lost. Useful for build, run, etc
set scrolloff=3 " Know the context -- scroll page when 3 lines close to the edge
set wildmenu " Tab completion for files & commands
set wildmode=list:longest,full " Complete on longest match and show full completions
" Quickly switch between next/previous buffers
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
set history=100 " remember 100 previous searches/commands
" Omnicomplete shift-tab
inoremap <S-TAB> <C-X><C-O>
" Leader
let mapleader = "\<space>"
let g:mapleader = "\<space>"
" { and } skip over closed folds
nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"
nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"
" Persistent undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000 " maximum number of changes that can be undone
set undoreload=10000 " maximum number lines to save for undo on a buffer reload

" Status line
" set statusline=%f\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 0

" Invisible characters
set list " Show invisible characters
" let &listchars = "tab:| ,trail:\u2588,extends:>,precedes:<,nbsp:\u00b7" " Show tabs, trailing whitespaces, and indicators for more text after > or before <
let &listchars = "tab:  ,trail:\u2588,extends:>,precedes:<,nbsp:\u00b7" " Show tabs, trailing whitespaces, and indicators for more text after > or before <

" YCM
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" File specific

" txt
autocmd BufNewFile,BufRead *.txt setlocal spell " Spell check .txt files
autocmd BufNewFile,BufRead *.txt set nonumber " Don't show line numbers for text files

" Ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Go / vim-go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

au FileType go nmap gd <Plug>(go-def)
au FileType go nmap gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>t <Plug>(go-def-tab)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>d <Plug>(go-doc)
" == The :w <cr> saves the file before running the action. Thanks to autowrite, no need to do this for build, run, etc.
au FileType go nmap <leader>t :w<cr><Plug>(go-test)
