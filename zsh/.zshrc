# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=5000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ryan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PATH=$HOME/.cargo/bin:$PATH

# Alias
alias pyvenv-create="virtualenv env"
alias pyvenv-activate="source env/bin/activate"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
