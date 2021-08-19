set runtimepath+=$HOME/.vim

" Set colorscheme
set background=dark
colo gruvbox


"""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'

" language plugins
Plug 'rust-lang/rust.vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""""

" tweaks
set nocompatible                                " dont need that
set scrolloff=7                                 " give the cursor some space
set nu rnu                                      " preffered line numbers
set backspace=eol,start,indent                  " backspace should do what it should do
set showcmd                                     " show what im doing
set nobackup noswapfile                         " turn off backups 
set noerrorbells novisualbell t_vb= tm=500      " no bell
set encoding=utf8                               " encoding
set expandtab smarttab shiftwidth=4 tabstop=4   " my style for tabs
set lbr tw=120                                  " linebreak
set path+=**                                    " index all files
set history=500                                 " vim should remember more
set wildmenu                                    " a must have
set hid                                         " buffer is hidden when abandoned
set hlsearch incsearch ignorecase smartcase     " better search
set noerrorbells novisualbell t_vb= tm=500      " no bell
set undodir=$HOME/.vim/temp_dirs/undodir        " set dir for persistent undo
set undofile                                    " enable persistent undo
set lazyredraw                                  " dont redraw on marco and script
set laststatus=2                                " always show status bar
set mouse=                                      " disable mouse
set title                                       " title to mouse being edited
set autoread                                    " update file when written outside of vim
set confirm                                     " confirm before closing unsaved file
set conceallevel=0                              " i dont want to conceal anything

" Highlight yanked test only in 0.5 neovim
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" for code
set autoindent
set smartindent
set wrap
syntax on
filetype on
filetype indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable adding comment on new line

" nerdtree
let g:NERDTreeWinPos = "right"


"""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

" yoink
" nmap q yy:bprev<cr>p:w<cr>:bprev<cr>j

" Write
nmap <leader>w :w!<cr>

" Double pressing ; will insert it at the end of the line
imap ;; <end>;

" enable spell checking
map <leader>s :setlocal spell! spelllang=en_us

" Reload rc
map <leader>r :source $HOME/.vimrc<cr>

" buf explorer
map <leader>o :ls<cr>:b 

" replace next <++> (inspired from luke smith)
nmap <silent> <leader><space> /<++><cr>:noh<cr>c4l

" Disable highlight when <leader><cr> is pressed
map <silent> <space> :noh<cr>

" Move between windows
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-h> <C-W>h
map <A-l> <C-W>l

" move between windows in terminal
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <esc> <C-\><C-N>

" Close the current buffer
map <silent> <leader>x :bd<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" To prevent suspending vim
map <C-z> <nop>

" map nerdtree
map <leader>nn :NERDTreeToggle<cr>
" jump to definition in coc
nmap <silent> <leader>gd <Plug>(coc-definition)
" reload coc
nnoremap <silent><expr> <c-space> coc#refresh()

" braces from amix's vimrc
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
