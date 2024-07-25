if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export PATH=/data/data/com.termux/files/usr/local/bin:/data/data/com.termux/files/usr/local/sbin:/data/data/com.termux/files/usr/sbin:/data/data/com.termux/files/usr/bin:/data/data/com.termux/files/sbin:/data/data/com.termux/files/bin


ZSH_THEME="powerlevel10k/powerlevel10k" 

plugins=(git jsontools)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH/oh-my-zsh.sh

alias nv="nvim"
alias code="nvim"
alias vim="nvim"
alias vi="nvim"
alias ls="la"
clear

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
