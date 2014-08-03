###########################
## cardoppler 2014-01-11 ##
###########################

# This file is ~/.bash_aliases and gets loaded by ~/.bashrc

alias c='clear;ls'

alias l='ls' # For mispelling of ls
alias ls-al='ls -al'
alias le='ls -althp' # List Extendes with less
alias lg='ls -althp | grep -i' # List and grep
alias lr='ls -la $(find .) | less' # list recursive

alias pingoo='ping -c 3 -s.1 www.google.com'
alias path='echo $PATH'

alias pg='ps -ef | grep -i'

alias h='history'
alias j="jobs -l"

export HISTTIMEFORMAT='%F %T ' #add date and time to the history

alias cd..="cd .."	# Correction for mispelling
alias ..="cd .."

alias fail="tail -f"

alias tree='tree | less'

# Git
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gc='git commit -a -m'
alias gpush='git push -u origin master'
alias gpull='git pull'




# Find Filename
# 2 arguments:
# A) From which directory the serach should start and
# B) for which filename it should look for
function ff {
    find $1 | grep -i $2
}


# Returns the absolute path of a given file
function ap() {
        find "`pwd`" -name $1
}

# History Grep
function hg {
        history | grep -i $1
}


eval "$(lesspipe)" # allows "less" command to open any kind of file type

# Avoid quitting the shell when hitting CTRL+D too many times by mistake
#set -o ignoreeof

# Multi-line commands are appended to the history as a single line. Useful for later command editing.
shopt -s cmdhist


# Avoid duplicate, spaces, and /^\s/ in history.
# IF you put a space before the command, it won't be shown in the history [which can be used on purpose]
HISTCONTROL=ignoredups:ignorespace


# Ignore the following commands in the history:
export HISTIGNORE='&:l:ls:le:ll:la:exit:c:clear:ls -al:ls -l:pwd:history:h'

# append to the history file, don't overwrite it
shopt -s histappend

# history length
HISTSIZE=2000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Change schema and color in the terminal:
#PS1="\e[0;31m\u\e[m\e[0;33m@\e[m\e[0;31m\h\e[m\e[0;33m \W\e[m : "

export BROWSER='google-chrome'
export EDITOR='vim'
set bell-style visible # avoid noise
set -o notify # notify when jobs running in background terminate


export LS_COLORS=""

# The following do not work:
#shopt -s nocaseglob
#shopt -s extglob # necessary for bash completion (programmable completion)
#shopt -s cdspell # this will correct minor spelling errors in a cd command

# find the IP addresses that are currently online in your network
function scan_network()
{
        sudo nmap -sL 192.168.0.* | grep "(1" | awk '{print $5 "\t" $6}' | column -t
}


function myip()
{
    ifconfig -a
    echo "External IP: "; curl ifconfig.me
}

# List available wireless networks
function wifi_scan()
{
    iwlist wlan0 scan | sed -ne 's#^[[:space:]]*\(Quality=\|Encryption key:\|ESSID:\)#\1#p' -e 's#^[[:space:]]*\(Mode:.*\)$#\1\n#p'
}

# Google search
function google_search() {
google-chrome "https://www.google.com/#q=${@}&safe=off"
}

# TODO:
# google-chrome "http://translate.google.com/#en/it/${@}"





alias ports="sudo netstat -tulanp"

# So all the commands run even when using sudo [which otherwise ignore bashrc]
alias sudo='sudo '

alias diff='colordiff'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'
alias poweroff='sudo /sbin/poweroff'

alias meminfo="free -m -l -t -h"
alias cpuinfo="lscpu"
alias diskinfo="udisksctl status"

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

alias wget='wget -c' # Resume wget by default

alias top="htop"

alias internet_speed='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'


### EveryCity Scripts ###
if [[ -e ~/bin/ec/bashrc_ec ]] ; then
    source ~/bin/ec/bashrc_ec
fi

# Shows hidden files in autocompletion
bind 'set match-hidden-files on'
