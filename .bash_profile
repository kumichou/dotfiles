if [ -f ~/.bashrc ] && [ "${SHELL##*/}" == "bash" ]
then
  . ~/.bashrc
fi
