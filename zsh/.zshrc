if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export EDITOR=nvim
export VISUAL=nvim


ZSH_THEME="powerlevel10k/powerlevel10k" 

plugins=(git jsontools zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

alias nv="nvim"
alias code="nvim"
alias vim="nvim"
alias vi="nvim"
bindkey '^L' autosuggest-accept


ts() {
  current_dir=$(pwd)
  cd ~
  selected_dir=$(find * -type d 2> /dev/null | fzf)

  if [[ -n "$selected_dir" ]]; then
    session_name=$(basename "$selected_dir")

    if tmux has-session -t "$session_name" 2>/dev/null; then
      echo "Session $session_name already exists."
      
      if [[ -n "$TMUX" ]]; then
        tmux switch-client -t "$session_name"
      else
        tmux attach-session -t "$session_name"
      fi
    else
      echo "Creating new session: $session_name"
      tmux new-session -d -s "$session_name" -c "$selected_dir"
      if [[ -n "$TMUX" ]]; then
        tmux switch-client -t "$session_name"
      else
        tmux attach-session -t "$session_name"
      fi
    fi
  else
    echo "No directory selected."
  fi
  cd "$current_dir"
}


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source <(ng completion script)
