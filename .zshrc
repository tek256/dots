# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/devon/.zshrc'

function folder {
	echo ${PWD##*/}
}

function simple {
	echo "::"
}

MNML_USER_CHAR=':'
MNML_NORMAL_CHAR='-'
MNML_INSERT_CHAR='>'
#MNML_PROMPT=(folder mnml_keymap)
MNML_PROMPT=(simple mnml_keymap)
MNML_RPROMPT=()
source .zsh/minimal.zsh

# CTRL - Backspace 
bindkey "\C-_" backward-kill-word
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\e0H" beginning-of-line
bindkey "\e0F" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e\d" undo

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias b="cd ~/astera/ && ./unix_build"
alias ra="cd ~/astera/build/ && ./astera"
alias e="vim ~/astera/"
