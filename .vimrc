" Vundle Configuration
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'ternjs/tern_for_vim'
Plugin 'mileszs/ack.vim'
"Plugin 'Lokaltog/vim-distinguished'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'zivyangll/git-blame.vim'
Plugin 'prettier/vim-prettier'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme molokai

set nu " show line number
" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=2
" 每一次缩进对应的空格数
set shiftwidth=2
" 按退格键时可以一次删掉 2个空格
set softtabstop=2
" insert tabs on the start of a line according to shiftwidth, not tabstop
" 按退格键时可以一次删掉 2 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set hls
set incsearch           " search as characters are entered
" set wildmenu            " visual autocomplete for command menu
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
" set smartcase

" 缩进配置
" Smart indent
set smartindent

syntax on

" https://jovicailic.org/2017/04/vim-persistent-undo/
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" F1 废弃这个键,防止调出系统帮助
" evils of <F1>
noremap <F1> <Esc>

" map space to toggle fold
set foldmethod=indent
nmap <Space> za

" auto mkview/loadview
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
" leader key as comma
let mapleader = ","

" swap file directory
" set directory=$HOME/.vim/swapfiles//

" settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
" Autofix entire buffer with eslint_d:
nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F
" Autofix visual selection with eslint_d:
vnoremap <leader>f :!eslint_d --stdin --fix-to-stdout<CR>gv

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=10
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" 如果安装了ag, 使用ag
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" K to lookup references
nnoremap K :Ack!<Space><CR>

" <leader> k to close quickfix/loclist window
autocmd FileType * nmap <buffer> <leader>k :lcl<cr>
autocmd FileType * nmap <buffer> <leader>k :ccl<cr>
" pclose : close scratch window
" autocmd FileType * nmap <buffer> <leader>c :pclose<cr>

" map nerdtree tabs toggle
map <Leader>t <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\~$','\.swp','\node_modules']
" let g:nerdtree_tabs_open_on_console_startup = 1
" airline
" let g:airline#extensions#tabline#enabled = 1

" add git status to statusline
set statusline+=%{fugitive#statusline()}

" youcompleteme config
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" <leader> d to go to definition
autocmd FileType * nmap <buffer> <leader>d :TernDef<cr>
" <leader> r to find all refs
autocmd FileType * nmap <buffer> <leader>r :TernRefs<cr>

