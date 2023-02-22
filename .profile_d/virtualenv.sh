#!/usr/bin/env bash

# The various escape codes that we can use to color our prompt.
RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[1;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

# Determine active Python virtualenv details.
# This function is patched into the ~/.rvm/contrib/ps1_functions file
ps1_virtualenv () {
    if test -z "$VIRTUAL_ENV" ; then
        printf "%s" ""
    else
        IFS='/'
        VPATH=($VIRTUAL_ENV)
        VNAME=${VPATH[${#VPATH[@]}-2]}
        printf "%s" "${BLUE}[${VNAME}]${COLOR_NONE} "
        IFS=$' \t\n'
    fi
}

upsearch () {
  slashes=${PWD//[^\/]/}
  directory="$PWD"
  for (( n=${#slashes}; n>0; --n )); do
    test -e "$directory/$1" && echo "$directory/$1" && return
    directory="$directory/.."
  done

    FILEPATH=`pwd`
    EVALUATEDPATH=$(readlink -m "$FILEPATH")
    echo $EVALUATEDPATH
}

_virtualenv_auto_activate() {
    if [[ -e .venv ]]; then
        # Check to see if already activated to avoid redundant activating
        if [[ $VIRTUAL_ENV != $(pwd -P)/.venv ]]; then
            _VENV_NAME=$(basename `pwd`)
            echo Activating virtualenv \"$_VENV_NAME\"...
            VIRTUAL_ENV_DISABLE_PROMPT=1
            source .venv/bin/activate
        fi
    else
        if [[ $(upsearch ".venv") == $(pwd) ]] && (type "deactivate" > /dev/null 2>&1;) then
            IFS='/'
            VPATH=($VIRTUAL_ENV)
            VNAME=${VPATH[${#VPATH[@]}-2]}    # Get parent directory of Virtual Env
            echo Deactivating virtualenv \"$VNAME\"...
            deactivate
            IFS=$' \t\n'  # Reset IFS to default
        fi
    fi
}

export PROMPT_COMMAND="_virtualenv_auto_activate; $PROMPT_COMMAND"
