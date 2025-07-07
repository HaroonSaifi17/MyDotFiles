if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export EDITOR=nvim
export VISUAL=nvim
export GTK_THEME=Dracula
export BROWSER=google-chrome-stable
export XDG_OPEN=xdg-open


ZSH_THEME="powerlevel10k/powerlevel10k" 

plugins=(git jsontools zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

alias nv="nvim"
alias code="nvim"
alias vim="nvim"
alias vi="nvim"
alias cd="z"

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

bindkey '^k' up-line-or-beginning-search
bindkey '^j' down-line-or-beginning-search
bindkey '^l' autosuggest-accept
# bindkey -s ^f "tmux-sessionizer\n"

home() {
  sudo systemctl restart NetworkManager
  sleep 2
  nmcli connection up Home
}

buds() {
  sudo systemctl start bluetooth
  sleep 2
  bluetoothctl connect 98:34:8C:DE:15:F8
}


jk() {
  if [[ -n $TMUX ]]; then
    tmux copy-mode
  fi
}


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# pnpm
export PNPM_HOME="/home/haroon/.nvm/versions/node/v20.18.3/bin/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

