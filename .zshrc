zstyle ':znap:*' repos-dir ~/.oh-my-zsh/znap
source ~/zsh-snap/znap.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
znap source marlonrichert/zsh-autocomplete

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



### Custom Stuff ###


###########################################################################################
#-----------------------------------------------------------------------------------------#
#-----Everything below this line is shell agnostic (works with at least bash and zsh)-----#
#-----------------------------------------------------------------------------------------#
###########################################################################################


#----------# FUNCTIONS #----------#

# penis function (prints out ascii vector from Despicable Me)
penisfunction () {
cat ~/vector100.ansi
}


## function to push to a repo

apush () {
echo 'Enter the commit message:'
read commitMessage

config commit -am "$commitMessage"

echo 'Enter the name of the branch:'
read branch

if [ $branch == ""]
then
	branch="master"
fi

config push githubrepo $branch && config push gitlabrepo $branch

}


# checks if the user is using a system with apt, yum, or pacman,
# then installs $1 

autoinst () {
if [ `whereis apt | wc -w` -gt 1 ] 
then 
	inst="apt install"
elif [ `whereis yum | wc -w` -gt 1 ] 
then
	inst="yum install"
elif [ `whereis pacman | wc -w` -gt 1 ] 
then
	inst="pacman -S"
fi

if [ `whereis $1 | wc -w` -gt 1 ]
then
return 2
fi

sudo $inst $1
}

packstodl=("zoxide" "exa" "toilet" "" "" "" "" "" "" "" "" "" "" "")

installreqs () {
for prog in packstodl
do
	autoinst $prog
done
}


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
#alias gabenewell='cat "/mnt/c/Program Files (x86)/Steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg/gabenewell.cfg"'
alias ema="
export DISPLAY=$(ip route | awk '/^default/{print $3; exit}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
setsid emacs
"
    


### GNU CoreUtils Aliases ###
#alias ls='ls -lah'
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

alias ps='ps -eaux'
alias rg='grep'


### Rust Alternative Aliases ###
#<<com
alias ls='exa -lamh --group-directories-first'


### Zoxide Setup Thing ###
eval "$(zoxide init bash --cmd cd)"
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
alias bashld="source ~/.bashrc"
alias gh="history | grep"


### Git Things ###
# Git bare repo command
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

## Useful Git Aliases ###
alias pushhub="config push githubrepo master"
alias pushlab="config push gitlabrepo master"
alias pushboth="config push githubrepo master && config push gitlabrepo master"


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


### Auto Install Statements ###
# autoinst exa
# installreqs

### Prompt ###
PS1="\n \[\033[0;34m\]┌─────(\[\033[1;35m\]\u\[\033[0;34m\])─────(\[\033[1;32m\]\w\[\033[0;34m\]) \n └> \[\033[1;36m\]\$ \[\033[0m\]"

### Pretty things at the end of the terminal ###
#neofetch
#toilet -t "Nice beans"
#toilet -t "Dingo Bongus"
alias toilet="toilet -f big --gay"
if [ `whereis toilet | wc -w` -gt 1 ]
then 
	alias toilet="toilet -f big --gay"
	toilet -t "Can I draw a penis in here??"
	penisfunction
	toilet -t "I guess I can!!" 
fi
#colorscript -r

