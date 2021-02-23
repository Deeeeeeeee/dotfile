#!/bin/bash
echo "▶▶▶ start install"
# 安装 zsh
if [ ! -f /usr/bin/zsh ]; then
    echo "▶▶▶ 安装zsh: sudo apt install zsh"
    sudo apt install zsh
else
    echo "▶▶▶ zsh 已安装"
fi
# 使用 zsh
echo "▶▶▶ 使用zsh: sudo chsh -s /bin/zsh"
sudo chsh -s /bin/zsh

# 安装 oh-my-zsh
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    echo "▶▶▶ 安装oh-my-zsh"
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "▶▶▶ oh-my-zsh 已经安装"
fi

# zsh 命令行提示和高亮
if [ -z $ZSH_CUSTOM ]; then
    echo "▶▶▶ ZSH_CUSTOM 环境变量不存在,zsh命令提示和高亮安装失败.请先执行\n rcup -t zsh"
fi
if [ ! -z $ZSH_CUSTOM -a ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "▶▶▶ zsh-autosuggestions 命令提示"
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [ ! -z $ZSH_CUSTOM -a ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "▶▶▶ zsh-syntax-highlighting 命令高亮"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# 安装 autojump
if [ ! -f /usr/bin/autojump ]; then
    echo "▶▶▶ 安装autojump"
    sudo apt install autojump
else
    echo "▶▶▶ autojump 已经安装"
fi

# 安装 tree
if [ ! -f /usr/bin/tree ]; then
    echo "▶▶▶ 安装tree"
    sudo apt install tree
else
    echo "▶▶▶ tree 已经安装"
fi

# 安装 fd-find
if [ ! -f /usr/bin/fdfind ]; then
    echo "▶▶▶ 安装fd-find"
    sudo apt install fd-find
else
    echo "▶▶▶ fd-find 已经安装"
fi

# 安装 fzf
if [ ! -d $HOME/.fzf ]; then
    echo "▶▶▶ 安装fzf"
    sudo apt install fzf
else
    echo "▶▶▶ fzf 已经安装"
fi

# 安装 ranger
if [ ! -f /usr/bin/ranger ]; then
    echo "▶▶▶ 安装ranger"
    sudo apt install ranger
else
    echo "▶▶▶ ranger 已经安装"
fi

# 安装 ripgrep
if [ ! -f /usr/bin/rg ]; then
    echo "▶▶▶ 安装ripgrep"
    sudo apt install ripgrep
else
    echo "▶▶▶ ripgrep 已经安装"
fi

# 安装 vim-plug. https://github.com/junegunn/vim-plug
if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
    echo "▶▶▶ 安装vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "▶▶▶ vim-plug 已经安装"
fi

# 安装 neovim
if [ ! -f /usr/bin/nvim ]; then
    echo "▶▶▶ 安装neovim"
    sudo apt install neovim
else
    echo "▶▶▶ neovim 已经安装"
fi

# 安装 nodejs. coc.nvim 需要
if [ ! -f /usr/bin/node ]; then
    echo "▶▶▶ 安装nodejs 14.x 版本"
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "▶▶▶ nodejs 已经安装. coc.nvim 需要"
fi

# 安装 clangd-11. https://clangd.llvm.org/installation.html
if [ ! -f /usr/bin/clangd ]; then
    echo "▶▶▶ 安装clangd 11 版本"
    sudo apt install clangd-11
else
    echo "▶▶▶ clangd 11 版本，已安装"
fi

# 配置 git difftool
while true
do
	read -r -p "▶▶▶ git config difftool vimdiff? [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
            echo "▶▶▶ git config --global diff.tool vimdiff"
            git config --global diff.tool vimdiff
            git config --global difftool.prompt No
            break
			;;
	    [nN][oO]|[nN])
            break
			;;
	    *)
			echo "Invalid input..."
			;;
	esac
done
echo "▶▶▶ end install"

# ln .vimrc
while true
do
    read -r -p "▶▶▶ ln -s ./tag-nvim/config/nvim/init.vim ~/.vimrc? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            echo "$HOME/.vimrc -> $PWD/tag-nvim/config/nvim/init.vim"
            ln -s $PWD/tag-nvim/config/nvim/init.vim $HOME/.vimrc
            break
            ;;
        [nN][oO]|[nN])
            break
            ;;
        *)
            echo "Invalid input..."
            ;;
    esac
done

