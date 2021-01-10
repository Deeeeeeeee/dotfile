# dotfile 说明

请至少读一遍这个 README.md 文件

此脚本目前只适合 debian 系的系统(包括ubuntu)

```
git clone https://gitee.com/sealde/dotfile.git ~/.dotfile
```

# 更换源

如果需要更换源，修改 `/etc/apt/sources.list` 文件

```
# 备份
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
# 修改
sudo vim /etc/apt/sources.list
# 更新源
sudo apt update
sudo apt upgrade
```

下面是 ubuntu 20 版本的网易源，其他版本需要另行修改

```
deb http://mirrors.163.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ focal-backports main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ focal main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ focal-security main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ focal-updates main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ focal-backports main restricted universe multiverse
# 预发布软件源，不建议启用
# deb http://mirrors.163.com/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ focal-proposed main restricted universe multiverse
```

# 安装 rcm

执行 install.sh 之前，先安装dotfile 管理工具 rcm. 如果安装出现问题，请参考 https://github.com/thoughtbot/rcm

```
# dotfile 配置文件管理
sudo apt install rcm
### 注意一下会覆盖你的配置文件！！!
# 会覆盖 ~/.rcrc
rcup -t rcm
# 会覆盖 ~/.zshrc
rcup -t zsh
```

# 执行 install.sh 脚本&说明

```
# 运行安装脚本. 建议安装之前看下安装内容
.install.sh
```

安装内容

- zsh 好用的shell
- oh-my-zsh 已经配置好的zsh，简化配置zsh的 https://github.com/ohmyzsh/ohmyzsh
- oh-my-zsh 插件
  - zsh-autosuggestions 命令提示插件 https://github.com/zsh-users/zsh-autosuggestions
  - zsh-syntax-highlighting 命令高亮插件 https://github.com/zsh-users/zsh-syntax-highlighting
- autojump 懒人目录跳转工具，j service 就能快速跳到目标目录. https://github.com/wting/autojump/
- fzf 模糊查找神器. https://github.com/junegunn/fzf
- ripgrep 模糊搜索神器. https://github.com/BurntSushi/ripgrep
- ranger 文件管理器. https://github.com/ranger/ranger
- vim-plug vim插件管理工具. https://github.com/junegunn/vim-plug
- neovim 年轻一代vim编辑器. https://github.com/neovim/neovim
- nodejs coc.nvim 需要，注意安装的版本，目前是 14.x
- git difftool 默认使用 vimdiff
  - git config --global diff.tool vimdiff
  - git config --global difftool.prompt No

# 额外说明

## 安装时连接失败

由于 dns 污染的缘故，安装过程中可能出现下载不了的问题，需要修改 hosts 文件

这里有个查询ip的地址 `https://www.ipaddress.com/ip-lookup`

## ubuntu20.04 没有 python-pip 包

```
# https://stackoverflow.com/questions/61981156/unable-to-locate-package-python-pip-ubuntu-20-04
sudo add-apt-repository universe
sudo apt update
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
sudo python2 get-pip.py
```

# 文件覆盖说明

.zshrc 文件

```
# 使用上面安装 zsh 的插件
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# 主题
ZSH_THEME="xxx"
# 使 autojump 生效
. /usr/share/autojump/autojump.sh
# 使用 nvim 代替 vim, rg 代替 ranger
alias vim=nvim
alias ra=ranger
# 使 fzf 生效
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```

.vimrc 文件详见 ./nvim/init.vim
.config/nvim 文件夹详见 ./nvim

# vim_ln.sh 脚本说明

```
# 注意使用前需要先删掉
ln -s ./nvim ~/.config/nvim
ln -s ./nvim/init.vim ~/.vimrc
```

安装 vim 插件

```
# 打开vim. 在 vim 编辑中输入下列命令
:PlugInstall
```

# zsh 主题推荐

```
# powerlevel10k https://github.com/romkatv/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
```

# wsl使用系统剪贴板

```
# https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
mv /tmp/win32yank.exe /usr/bin
```

