" General " {{{
set nocompatible            " iMproved
set history=256             " Store a ton of history (default is 20)
set shiftround              " round indent to multiple of 'shiftwidth'
set tags=./tags;$HOME       " walk directory tree upto $HOME looking for tags
set background=dark         " Assume a dark background
"set clipboard+=unnamed
set clipboard+=unnamedplus
set pastetoggle=<F10>       " I -> (paste)
set encoding=utf-8
scriptencoding utf-8
set modeline
set autowrite
set autoread
set nobackup
set nowritebackup
set directory=/tmp//        " backup files
set hidden                  " allow buffer switching without saving
set hlsearch                " highlight search terms
set ignorecase              " case insensitive search
set smartcase               " be case sensitive when input has a capital letter
set incsearch               " show matches while typing
let g:is_posix = 1          " vim's default is archaic bourne shell, bring it up to the 90s
let mapleader = ','
" "}}}

" Visual {{{
syntax on                   " syntax highlighting
if &term == 'xterm' || &term == 'screen'
    set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif
set mouse=a                 " enable moude in GUI mode
set mousehide               " Hide mouse after chars typed
set nonumber
set showmatch               " show matching brackets/parenthesis
set matchtime=2
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set completeopt+=preview
set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error
set laststatus=2              " always show status line.
set laststatus=2
set statusline=%<%f\          " Filename
set statusline+=%w%h%m%r      " Options
set statusline+=\ [%{&ff}/%Y] " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set virtualedit=block         " allow for cursor beyond last character
set showcmd                   " show partial commands in status line and
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
" Fold ?
"set foldenable                " Turn on folding
"set foldmethod=marker         " Fold on the marker
"set foldlevel=100             " Don't autofold anything (but I can still fold manually)
"
"set foldopen=block,hor,tag    " what movements open folds
"set foldopen+=percent,mark
"set foldopen+=quickfix
" "}}}

" Formatting "{{{
set textwidth=0                 " Don't wrap lines by default
set autoindent                  " indent at the same level of the previous line
set cindent
set shiftwidth=4                " use indents of 4 spaces
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent
set smarttab
set expandtab                   " tabs are spaces, not tabs
set matchpairs+=<:>                " match, to be used with %
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
set backspace=indent
set backspace+=eol
set backspace+=start
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
" "}}}

" Key mapping " {{{

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> <C-k> <C-W><C-k>
nmap <silent> <C-j> <C-W><C-j>
nmap <silent> <C-h> <C-W><C-h>
nmap <silent> <C-l> <C-W><C-l>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>
"inoremap jj <ESC>
"
" }}}

" Scripts and Bundles " {{{
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bufexplorer.zip'

" Programming
Bundle 'jQuery'
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
set completeopt-=menu,preview

" Syntax highlight
Bundle 'gmarik/vim-markdown'

" Utility
Bundle 'Gundo'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'repeat.vim'
Bundle 'surround.vim'
Bundle 'file-line'
Bundle 'Align'
Bundle 'lastpos.vim'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key='<LocalLeader>'

Bundle 'ZoomWin'
noremap <leader>o :ZoomWin<CR>
vnoremap <leader>o <C-C>:ZoomWin<CR>
inoremap <leader>o <C-O>:ZoomWin<CR>

Bundle 'tlib'
Bundle 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" CtrlP
Bundle 'kien/ctrlp.vim'
"nnoremap <C-[> :CtrlPBuffer<CR>
"noremap <C-[> :CtrlPBuffer<CR>
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>'],
    \ 'PrtHistory(-1)':       ['<down>'],
    \ 'PrtHistory(1)':        ['<up>'],
    \ }

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|build$'

" Git integration
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

nnoremap <leader>W :Gwrite<CR>
nnoremap <leader>C :Gcommit -v<CR>
nnoremap <leader>S :Gstatus \| 7<CR>
inoremap <leader>W <Esc><leader>W
inoremap <leader>C <Esc><leader>C
inoremap <leader>S <Esc><leader>S

" Bundle 'int3/vim-extradite'
Bundle 'Lokaltog/vim-powerline'
Bundle 'gregsexton/gitv'

" Snippets
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "honza/snipmate-snippets"
"Bundle "garbas/vim-snipmate"
"

filetype plugin indent on
" " }}}
