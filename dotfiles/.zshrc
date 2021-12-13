# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -x "$(command -v colorls)" ]; then
    alias ls="colorls"
    alias la="colorls -al"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias k=kubectl
complete -F __start_kubectl k
alias k=kubectl
complete -F __start_kubectl k
[[ /opt/homebrew/bin/kubectl ]] && source <(kubectl completion zsh)

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
‘source /dev/fd/14’

# Go
if which go >/dev/null; then
  export GOPATH=$(go env GOPATH)
  export GOROOT=$(go env GOROOT)
  export GOBIN=$GOPATH/bin
  echo $PATH | grep -q $GOPATH/bin || export PATH=$GOPATH/bin:$PATH
  echo $PATH | grep -q $GOROOT/bin || export PATH=$GOROOT/bin:$PATH
fi

# Homebrew
if command -v brew >/dev/null; then
  BREWSBIN=/usr/local/sbin
  BREWBIN=/usr/local/bin
  echo $PATH | grep -q $BREWSBIN || export PATH=$BREWSBIN:$PATH
  echo $PATH | grep -q $BREWBIN || export PATH=$BREWBIN:$PATH
fi

### ALIASES

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias ke='kubectl edit'
alias kd='kubectl describe'
alias kdd='kubectl delete'
alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kns='kubens'
alias kcx='kubectx'
alias wkgp='watch kubectl get pod'
