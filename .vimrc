let mapleader = "\\"
set nocompatible              " be iMproved, required
set number
set numberwidth=5
set hidden
set cursorline
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set textwidth=120
set colorcolumn=+1
set splitright
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

Plugin 'kana/vim-textobj-user'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'godlygeek/tabular'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Align'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mxw/vim-jsx'
Plugin 'carakan/new-railscasts-theme'
Plugin 'junegunn/vim-easy-align'
call vundle#end()            " required

colorscheme new-railscasts
let g:EclimCompletionMethod = 'omnifunc'
runtime macros/matchit.vim
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
set ts=2 sw=2 et
set mouse=a
nmap <leader>ne :NERDTree<cr>

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

if !exists('g:splitresize_hmin') | let g:splitresize_hmin = 40 | en
if !exists('g:splitresize_vmin') | let g:splitresize_vmin = 20 | en
if !exists('g:splitresize_hmax') | let g:splitresize_hmax = 80 | en
if !exists('g:splitresize_vmax') | let g:splitresize_vmax = 60 | en

nn <silent><C-J> <C-W><C-J>:call Splitresize()<CR>
nn <silent><C-K> <C-W><C-K>:call Splitresize()<CR>
nn <silent><C-L> <C-W><C-L>:call Splitresize()<CR>
nn <silent><C-H> <C-W><C-H>:call Splitresize()<CR>

function! Splitresize()
  let hmax = max([winwidth(0), float2nr(&columns*0.75), g:splitresize_hmin])
  let vmax = max([winheight(0), float2nr(&lines*0.75), g:splitresize_vmin])
  exe "vertical resize" . (min([hmax, g:splitresize_hmax]))
  exe "resize" . (min([vmax, g:splitresize_vmax]))
endfunction

execute pathogen#infect()
call pathogen#infect()

syntax on
filetype plugin indent on    " required
