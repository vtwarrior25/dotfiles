#  _____                _______________________________                  ______
#  \    \              /    /                    \     \                /     /
#   \    \            /    /                      \     \              /     /
#    \    \          /    /_________      _________\     \            /     /
#     \    \        /    /         |      |         \     \    /\    /     /
#      \    \      /    /          |      |          \     \  /  \  /     /
#       \    \    /    /           |      |           \     \/    \/     /
#        \    \  /    /            |      |            \                /
#         \    \/    /             |      |             \      /\      /
#          \        /              |      |              \    /  \    /
#           \______/               |______|               \__/    \__/
#   
#   __________________________________________________________________________                                                       
#  |                                                                          |
#  |     Nick Steventon (vtwarrior25)                                         |
#  |                                                                          | 
#  |     https://gitlab.com/vtwarrior25                                       |
#  |     https://github.com/vtwarrior25                                       |
#  |	 https://<linktothing>       		               		                      |
#  |	 https://<linktothing> 	                              		              |
#  |									                                                        |
#  |									                                                        |
#  |									                                                        |	
#  |                                                                          |
#  |__________________________________________________________________________|




# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
. "$HOME/.cargo/env"


### bash specific statements ###

### Shopt commands ###
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks size of terminal window


### Export statements ###
export EDITOR=vim
export HISTCONTROL=ignoredupes:erasedups:ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%Y-%m-%d %T "

### startup sounds (just for a test) 


### Execute the .aliases file ###
. ~/.aliases

