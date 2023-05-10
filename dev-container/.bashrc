# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

PS1='[\[\033[1;34m\]\u\[\033[0m\]@\h \W]\$ '
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

test -s ~/.alias && . ~/.alias || true

EDITOR="nvim"
alias vim='nvim'
alias nano='nvim'
alias emacs='nvim'

alias please='sudo !!'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias podman='podman --remote'

PATH=${PATH}:/usr/bin:${HOME}/.local/bin