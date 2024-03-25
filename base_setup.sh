mkdir -p ~/.vim/pack/themes/start && cd ~/.vim/pack/themes/start && git clone https://github.com/dracula/vim.git dracula

touch ~/.vimrc

echo "if v:version < 802\n\tpackadd! dracula\nendif\n" > ~/.vimrc

echo 'function! GitBranch()\n\treturn system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\''\\n'\''")\nendfunction\n' >> ~/.vimrc

echo "function! StatuslineGit()\n\tlet l:branchname = GitBranch()\n\treturn strlen(l:branchname) > 0?'  '.l:branchname.' ':''\nendfunction\n" >> ~/.vimrc

echo "syntax enable" >> ~/.vimrc

echo "colorscheme dracula" >> ~/.vimrc

echo "set number" >> ~/.vimrc

echo "set scrolloff=20" >> ~/.vimrc

echo "set cursorline" >> ~/.vimrc

echo "set showcmd" >> ~/.vimrc

echo "set showmode" >> ~/.vimrc

echo "set showmatch" >> ~/.vimrc

echo "set hlsearch" >> ~/.vimrc

echo "set incsearch" >> ~/.vimrc

echo "set ignorecase" >> ~/.vimrc

echo "set smartcase" >> ~/.vimrc

echo "set backup" >> ~/.vimrc

echo "set laststatus=2" >> ~/.vimrc

echo "set statusline=" >> ~/.vimrc

echo "set statusline=%F%{StatuslineGit()}%m%r%h%w%=\ (Time:\ %{strftime(\'%H:%M\')})\ [%Y]\ [%03l,%03v]\ [%l/%L]" >> ~/.vimrc