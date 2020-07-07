" .vimrc  : VIM settings
" Author  : Jonas De Moor

" General {{{

set nocompatible    " disable vi compatiblity
set nobackup        " Disable backups
set nowritebackup   " Disable backups
set noswapfile      " No swap (.swp) files
set hidden          " keep buffers open
set incsearch       " Search as you type
set nohlsearch      " Disable search highlighting

" Do not load netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" }}}

" Indentation {{{

set shiftwidth=2    " number of spaces to use for each step of indent
set softtabstop=2   " number of spaces that a tab counts for while editing
set shiftround      " round the indent to a multiple of shiftwidth
set expandtab       " expand tabs to spaces
set autoindent      " automatically indent a new line
set tabstop=2       " number of spaces that a tab counts for
filetype indent on  " load filetype-specific indent files
set softtabstop=2   " number of spaces in tab when editing

" }}}

" Keybindings {{{

" Open Dirvish
map <C-e> :Dirvish<CR>

" fzf
map <C-p> :FZF<CR>
map <C-b> :Buffers<CR>

" }}}

" UI {{{

" Editor
syntax enable           " syntax coloring
set number	            " line numbers
set relativenumber      " relative line numbers
set showmatch           " highlight matching [{()}]
set laststatus=0 ruler  " Show line and cursor position + hide statusbar
set guicursor=          " Always use block cursor in insert mode

" Colorscheme
if (has("termguicolors"))
    set termguicolors
endif

packadd! dracula
colorscheme dracula

" Set a marker at 80 chars
highlight ColorColumn ctermbg=red guibg=red
set colorcolumn=80

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Foldings
set modelines=1

" }}}

" Languages {{{

" Ansible
autocmd BufRead,BufNewFile */playbooks/*.yaml set filetype=yaml.ansible

"}}}

" vim:foldmethod=marker:foldlevel=0
