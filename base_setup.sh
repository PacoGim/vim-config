#!/bin/bash
echo Enter your 42 student login for the header, please:
read varname

mkdir -p ~/.vim/pack/themes/start && cd ~/.vim/pack/themes/start && git clone https://github.com/dracula/vim.git dracula

mkdir ~/.vim_backup_files

touch ~/.vimrc

echo "if v:version < 802\n\tpackadd! dracula\nendif\n" > ~/.vimrc

echo 'function! GitBranch()\n\treturn system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\''\\n'\''")\nendfunction\n' >> ~/.vimrc

echo "function! StatuslineGit()\n\tlet l:branchname = GitBranch()\n\treturn strlen(l:branchname) > 0?'  '.l:branchname.' ':''\nendfunction\n" >> ~/.vimrc

echo "let g:mail42 = '$varname@student.42.fr'" >> ~/.vimrc
echo "let g:user42 = '$varname'" >> ~/.vimrc

cat >> ~/.vimrc << 'EOL'
colorscheme dracula
syntax enable

set belloff=all
set novisualbell
set visualbell t_vb=
set list lcs=tab:·⁖,trail:¶
set nolist

set number
set cursorline
set scrolloff=20
set colorcolumn=80

set shiftwidth=6
set tabstop=6
set autoindent

set laststatus=2
set statusline=
set statusline=%F%{StatuslineGit()}%m%r%h%w%=\ (Time:\ %{strftime(\'%H:%M\')})\ [%Y]\ [%03l,%03v]\ [%l/%L]

set completeopt=menuone,longest,preview
set smartcase
set ignorecase
set incsearch
set hlsearch
set showmatch
set showmode
set showcmd

set backup
set backupdir=~/.vim_backup_files

let mapleader = ","
nnoremap <S-s> <Esc>:m+1 <CR>
nnoremap <S-w> <Esc>:m-2 <CR>
vnoremap <S-s> :m '>+1<CR>
vnoremap <S-w> :m-2<CR>
nnoremap <Leader>rws :%s:\s\+$::<CR>:let @/=''<CR>
nnoremap <C-s> :w<CR>
inoremap <M-Space> <C-n>
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <Bar> :%s/^\ \+// <CR>
EOL