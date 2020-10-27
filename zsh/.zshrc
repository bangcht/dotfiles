#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Customize to your needs...

export PATH="$PATH:/home/bangcht/.rvm/bin" # Add RVM to PATH for scripting

# Python virtualenvwraper
export WORKON_HOME=~/.python_environments
source /usr/bin/virtualenvwrapper.sh

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export TERM=xterm

# editor and visual
export EDITOR=vim
export VISUAL=vim

# my alias
alias x="startx"
alias _chrome="google-chrome-stable"
# alias _chromium="chromium"
alias tmux="TERM=screen-256color-bce tmux"

eval "$(thefuck --alias)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
