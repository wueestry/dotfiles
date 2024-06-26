# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=5000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ryan/.zshrc'

PATH=$HOME/.cargo/bin:$PATH

autoload -Uz compinit
compinit
# End of lines added by compinstall

#distro=$(lsb_release -sc)
#if [[ $distro == "focal" ]]; then
#  # ROS Noetic config
#  source /opt/ros/noetic/setup.zsh
#  source ~/dev/catkin_ws/devel/setup.zsh
#
#  alias rviz="QT_QPA_PLATFORM=xcb rviz"
#elif [[ $distro == "jammy" ]]; then
#  # ROS Humble config
#  source /opt/ros/humble/setup.zsh
#  source ~/dev/ros2_ws/install/setup.zsh
#fi

alias pyvenv-create="virtualenv env"
alias pyvenv-activate="source env/bin/activate"
alias humble="source /opt/ros/humble/setup.zsh && source $HOME/dev/ros2_ws/install/setup.zsh"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

