#!/bin/sh
args=("$@")

function safe_cp() {
  local fp="$1"
  local target_fp="$2"

  if [[ -f "$target_fp" ]]; then
    mv "$target_fp" "${target_fp}_bkp"
    echo "$target_fp moved to ${target_fp}_bkp"
  fi

  cp "$fp" "$target_fp"
}

if [[ ${args[@]} =~ "help" ]]; then
  echo "./apply.sh [all|alacritty|picom|git|vim] [fresh]"
  echo "fresh: install vim-plug"
  echo "ex:    ./apply.sh all fresh"
  echo "ex2:   ./apply.sh vim git fresh"
  exit
fi

if [[ ${args[@]} =~ "alacritty" ]] || [[ ${args[@]} =~ "all" ]]; then
  safe_cp "alacritty.toml" "$HOME/.config/alacritty.toml"
fi

if [[ ${args[@]} =~ "picom" ]] || [[ ${args[@]} =~ "all" ]]; then
  safe_cp "picom.conf" "$HOME/.config/picom.conf"
fi

if [[ ${args[@]} =~ "git" ]] || [[ ${args[@]} =~ "all" ]]; then
  safe_cp ".gitconfig" "$HOME/.gitconfig"
fi

if [[ ${args[@]} =~ "vim" ]] || [[ ${args[@]} =~ "all" ]]; then
  safe_cp ".vimrc" "$HOME/.vimrc"

  # Vim plug install
  if [[ ${args[@]} =~ "fresh" ]]; then
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  fi

  vim -c 'PlugInstall --sync' -c 'qa'
fi


if [[ ${args[@]} =~ "zsh" ]] || [[ ${args[@]} =~ "all" ]]; then
  safe_cp ".zshrc" "$HOME/.zshrc"
  mkdir -p "$HOME/.config/zsh"
  safe_cp "zsh/minimal.zsh" "$HOME/.config/zsh/minimal.zsh"
fi

