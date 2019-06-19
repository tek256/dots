#!/bin/sh
if [ ! -z "$1" ];then
	cp ../../.vimrc $1
	cp ../../.xmodmap $1
	cp ../../.Xresources $1
	cp ../../.zshrc $1
else
	cp ../../.vimrc ~/
	cp ../../.xmodmap ~/
	cp ../../.Xresources ~/
	cp ../../.zshrc ~/
fi

xrdb ~/.Xresources
