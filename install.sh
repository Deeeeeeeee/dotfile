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

# 安装 fzf
if [ ! -d $HOME/.fzf ]; then
    echo "▶▶▶ 安装fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    sh $HOME/.fzf/install
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
    sudo apt install noevim
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

