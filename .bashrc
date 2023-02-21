
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/aclocal:$PATH

if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi

alias brewski='brew update && brew upgrade; brew cleanup; brew doctor'
alias purge_all_xcode_builds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

alias ls="ls --color=auto"
alias ll="ls -la"

export CLICOLOR=true
export LSCOLORS=GxFxCxDxBxegedabagaced
export LESS="-erX"
export PAGER=less

export HISTTIMEFORMAT="%d/%m/%y %T "

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PIPENV_VENV_IN_PROJECT=1

# Keep this before any kind of BASH prompt customization
# https://github.com/mrzool/bash-sensible
# wget --directory-prefix=~/bash-sensible https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash
if [ -f ~/bash-sensible/sensible.bash ]; then
  source ~/bash-sensible/sensible.bash
fi

