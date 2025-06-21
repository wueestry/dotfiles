# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=5000
SAVEHIST=10000
bindkey -v

# Path
PATH=$HOME/.cargo/bin:$PATH
PATH=/usr/local/go/bin:$PATH

# Alias
alias flake-dev="nix develop --no-pure-eval"

if command -v eza &>/dev/null; then
  alias ls="eza"
  alias ll="eza -alF"
  alias la="eza -A"
  alias l="eza -F"
else
  alias ll="ls -alF"
  alias la="ls -A"
  alias l="ls -CF"
fi

if command -v nala &>/dev/null; then
  alias apt="sudo nala"
elif command -v apt &>/dev/null; then
  alias apt="sudo apt"
fi

if command -v nvim &>/dev/null; then
  export EDITOR=nvim
  export VISUAL=nvim
  alias vim='nvim'
  alias vi='nvim'
else
  export EDITOR=vim
  export VISUAL=vim
fi

alias docker-clean=' 
  docker container prune -f ; 
  docker image prune -f ; 
  docker network prune -f ; 
  docker volume prune -f '

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Fastfetch
if command -v fastfetch &>/dev/null; then
  fastfetch -c $HOME/.config/fastfetch/config-mini.jsonc
fi

# Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias docker-clean=' 
  docker container prune -f ; 
  docker image prune -f ; 
  docker network prune -f ; 
  docker volume prune -f '

if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  echo "Install starship"
fi

if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh)"
fi

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# Extracts any archive(s) (if unp isn't installed)
extract() {
  for archive in "$@"; do
    if [ -f "$archive" ]; then
      case $archive in
      *.tar.bz2) tar xvjf $archive ;;
      *.tar.gz) tar xvzf $archive ;;
      *.bz2) bunzip2 $archive ;;
      *.rar) rar x $archive ;;
      *.gz) gunzip $archive ;;
      *.tar) tar xvf $archive ;;
      *.tbz2) tar xvjf $archive ;;
      *.tgz) tar xvzf $archive ;;
      *.zip) unzip $archive ;;
      *.Z) uncompress $archive ;;
      *.7z) 7z x $archive ;;
      *) echo "don't know how to extract '$archive'..." ;;
      esac
    else
      echo "'$archive' is not a valid file!"
    fi
  done
}

# Show the current distribution
distribution() {
  local dtype="unknown" # Default to unknown

  # Use /etc/os-release for modern distro identification
  if [ -r /etc/os-release ]; then
    source /etc/os-release
    case $ID in
    fedora | rhel | centos)
      dtype="redhat"
      ;;
    sles | opensuse*)
      dtype="suse"
      ;;
    ubuntu | debian)
      dtype="debian"
      ;;
    gentoo)
      dtype="gentoo"
      ;;
    arch | manjaro)
      dtype="arch"
      ;;
    slackware)
      dtype="slackware"
      ;;
    *)
      # Check ID_LIKE only if dtype is still unknown
      if [ -n "$ID_LIKE" ]; then
        case $ID_LIKE in
        *fedora* | *rhel* | *centos*)
          dtype="redhat"
          ;;
        *sles* | *opensuse*)
          dtype="suse"
          ;;
        *ubuntu* | *debian*)
          dtype="debian"
          ;;
        *gentoo*)
          dtype="gentoo"
          ;;
        *arch*)
          dtype="arch"
          ;;
        *slackware*)
          dtype="slackware"
          ;;
        esac
      fi
      # If ID or ID_LIKE is not recognized, keep dtype as unknown
      ;;
    esac
  fi

  echo $dtype
}

if [ -e /home/ryan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ryan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
