#!/bin/bash

echo $PWD

# ln .vimrc
while true
do
    read -r -p "▶▶▶ ln -s ./nvim/init.vim ~/.vimrc? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            echo "$HOME/.vimrc -> $PWD/nvim/init.vim"
            ln -s $PWD/nvim/init.vim $HOME/.vimrc
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

# ln nvim
if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
fi
if [ -d "$HOME/.config/nvim" ]; then
    read -r -p "▶▶▶ nvim文件夹已经存在，需要mv到 bak. now mv? [Y/n]" input
    case $input in
        [yY][eE][sS]|[yY])
            echo "▶▶▶ mv $HOME/.config/nvim $HOME/.config/nvim.bak"
            mv $HOME/.config/nvim $HOME/.config/nvim.bak
    		;;
        [nN][oO]|[nN])
            exit 1
           	;;
        *)
    		echo "Invalid input..."
    		exit 1
    		;;
    esac
fi
while true
do
    read -r -p "▶▶▶ ln -s ./nvim ~/.config/nvim? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            echo "$HOME/.config/nvim -> $PWD/nvim"
            ln -s $PWD/nvim $HOME/.config/nvim
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
echo "▶▶▶ end vim_ln"