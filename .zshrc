HISTFILE=~/.cache/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

function folder {
  echo ${PWD##*/}
}

function simple {
  echo "::"
}

MNML_USER_CHAR=':'
MNML_NORMAL_CHAR='-'
MNML_INSERT_CHAR='>'
# MNML_PROMPT=(folder mnml_keymap)
MNML_PROMPT=(simple mnml_keymap)
MNML_RPROMPT=()
source ~/.config/zsh/minimal.zsh

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
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

[ -f ~/.cache/zsh/fzf.zsh ] && source ~/.cache/zsh/fzf.zsh

# Add gpg agent
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

alias b="cmake --build build"
alias s="cmake -GNinja -Bbuild -S. -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++"
