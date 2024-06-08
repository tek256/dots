#~/.zshrc

HISTFILE=~/.cache/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
KEYTIMEOUT=1
bindkey -e

function folder {
  echo ${PWD##*/} "::"
}

function simple {
  echo "::"
}

MNML_USER_CHAR=':'
MNML_NORMAL_CHAR='-'
MNML_INSERT_CHAR='>'
MNML_PROMPT=(folder mnml_keymap)
#MNML_PROMPT=(simple mnml_keymap)
MNML_RPROMPT=()
source ~/.config/zsh/minimal.zsh

# CTRL - Backspace 
# bindkey "\C-_" backward-kill-word
bindkey "\e[1~" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# CTRL + Arrows 
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# urxvt
bindkey "\e0c" forward-word
bindkey "\e0d" backward-word

# CTRL + backspace
bindkey '^H' backward-kill-word

# CTRL + DEL
bindkey "\e[3;5~" kill-word
# urxvt
bindkey "\e[3^" kill-word

# CTRL + SHIFT + DEL
bindkey "\e[3;6~" kill-line
# urxvt
bindkey "\e[3@" kill-line


# SHIFT + Arrows 
bindkey "^[[1;2C" forward-word
bindkey "^[[1;2D" backward-word

# ALT + Arrows
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

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
bindkey "^Z" undo
bindkey "^[^Z" redo

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

[ -f ~/.cache/zsh/fzf.zsh ] && source ~/.cache/zsh/fzf.zsh

# Add gpg agent
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export RIPGREP_CONFIG_PATH=/home/devon/.config/rgrc

alias b="cmake --build build"
alias s="cmake -Bbuild -S. -GNinja"
# Old VPN commands
# alias vpnup="sudo rc-service wg_pia start"
# alias vpndown="sudo rc-service wg_pia stop"

vpnup() {
  if [ -z "$1" ]; then
    echo "Usage: vpnup <vpn_name>"
  else
    sudo nmcli connection up "$1"
  fi
}

vpndown() {
  if [ -z "$1" ]; then
    echo "Usage: vpndown <vpn_name>"
  else 
    sudo nmcli connection down "$1"
  fi
}

alias vpnactive="nmcli connection show --active"
alias vpnall="nmcli connection show"
alias logd="/home/devon/.script/log.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:/home/devon/.tool/sharpmake"

# Created by `userpath` on 2023-09-18 23:09:55
export PATH="$PATH:/home/devon/.local/bin"
