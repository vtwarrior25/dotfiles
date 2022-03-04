# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

# Stuff I added 
# export DISPLAY=$DISPLAY
# export LIBGL_ALWAYS_INDIRECT=1


#----------# FUNCTIONS #----------#

#doinginstallscenario

## function to push to a repo

apush(){
echo 'Enter the commit message:'
read commitMessage

config commit -m "$commitMessage"

echo 'Enter the name of the branch:'
read branch

config push githubrepo $branch && config push gitlabrepo $branch

}


# checks if the user is using a system with apt, yum, or pacman,
# then installs $1 

#function autoinstallfunc {
#if [ `whereis apt | wc -w` -gt 1 ] then 
#	inst="apt install"
#elif [ `whereis yum | wc -w` -gt 1 ] then
#	inst="yum install"
#elif [ `whereis pacman | wc -w` -gt 1 ] then
#	inst="pacman -S"
#fi

#$inst $1
#}

#----------# ALIASES #----------#
alias ..='cd ..'


### Interactive Versions of Dangerous Commands ### 
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'


### PS Aliases ###
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias pse="ps -ef"

### Curl Aliases
alias weather='curl wttr.in/05767'
alias weather2='curl v2.wttr.in/05767'


### WSL Specific Things ###
alias winhome="cd /mnt/c/Users/cosmi"
alias gabenewell='cat "/mnt/c/Program Files (x86)/Steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg/gabenewell.cfg"'

### GNU CoreUtils Aliases ###
#alias ls='ls -lah'
alias ps='ps -eaux'
alias rg='grep'


### Rust Alternative Aliases ###
#<<com
alias ls='exa -lamh --group-directories-first'


### Zoxide Setup Thing ###
eval "$(zoxide init bash)"
#com


### Apt Aliases ###
alias aptup="sudo apt update && sudo apt upgrade"
alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade" 


### Pacman Aliases (for Arch Users) ###
#alias pacup="sudo pacman -Syy && "
#alias pacupd="sudo pacman -Syy" 
#alias pacupg="sudo pacman -Syu"


### System Administration Aliases ###
alias getusrs="cat /etc/passwd | awk -F ':' '{print $1}'" # this doesn't work correctly, need to fix at some point
alias bashed="vim ~/.bashrc"
alias bashld="source .bashrc"
alias gh="history | grep"


### Git Things ###
# Git bare repo command
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

## Useful Git Aliases ###
alias pushhub="config push githubrepo master"
alias pushlab="config push gitlabrepo master"
alias pushboth="config push githubrepo master && config push gitlabrepo master"



### Export statements ###
export EDITOR=vim
export HISTCONTROL=ignoredupes:erasedups


### yt-dlp commands ###
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "

alias ytv-best="yt-dlp -f bestvideo+bestaudio "
alias ytdlist="yt-dlp -a ytdlplist.txt"


### Shopt commands ###
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases


### Prompt ###
PS1="\n \[\033[0;34m\]┌─────(\[\033[1;35m\]\u\[\033[0;34m\])─────(\[\033[1;32m\]\w\[\033[0;34m\]) \n └> \[\033[1;36m\]\$ \[\033[0m\]"

### Checking if figlet and neofetch are installed
### if not, will install them.
#autoinstallfunc figlet
#autoinstallfunc neofetch

### Pretty things at the end of the terminal ###
#neofetch
figlet -t "Nice beans"
figlet -t "Dingo Bongus"
figlet -t "Can I draw a penis in here??"
#figlet -t < ~/figletinput.txt 
colorscript -r

