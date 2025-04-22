# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=5000
SAVEHIST=10000
bindkey -v

# Path
PATH=$HOME/.cargo/bin:$PATH

# Alias
alias flake-dev="nix develop --no-pure-eval"

if command -v eza &> /dev/null; then
  alias ls="eza"
  alias ll="eza -alF"
  alias la="eza -A"
  alias l="eza -F"
else
  alias ll="ls -alF"
  alias la="ls -A"
  alias l="ls -CF"
fi

if command -v nala &> /dev/null; then
  alias apt="sudo nala"
elif command -v apt &> /dev/null; then
  alias apt="sudo apt"
fi

if command -v nvim &> /dev/null; then
    export EDITOR=nvim
    export VISUAL=nvim
    alias vim='nvim'
    alias vi='nvim'
else
    export EDITOR=vim
    export VISUAL=vim
fi

alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '
eval "$(starship init zsh)"

if [ -e /home/ryan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ryan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
