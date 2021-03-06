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
    xterm-color) color_prompt=yes;;
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








### cardoppler stuff below ###


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



if [ -f /etc/bash_completion ]; then
         . /etc/bash_completion 
fi

### HISTORY ###
# don't put duplicate lines or lines starting with space in the history.
# Avoid duplicate, spaces, and /^\s/ in history.
# IF you put a space before the command, it won't be shown in the history [which can be use     73 d on purpose]
HISTCONTROL=ignoreboth:ignoredups:ignorespace

# append to the ~/.bash_history file.
shopt -s histappend

# Multi-line commands are appended to the history as a single line. Useful for later command editing.
shopt -s cmdhist

# make writing to .bash_history immediate so you can share the history of the commands between different terminals without having to close the session
# -a run at each shell prompt and immediately writes the current/new lines to the history file.
# -c clears the history of the running session. This will reduce the history counter by the amount of $HISTSIZE.
# -r read the contents of $HISTFILE and insert them in to the current running session history. this will raise the history counter by the amount of lines in $HISTFILE. 
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Add the date to the history commands
export HISTTIMEFORMAT="%d/%m/%y %T "

# Ignore the following commands in the history:
export HISTIGNORE='&:l:ls:le:ll:la:exit:c:clear:ls -al:ls -l:pwd:history:h'


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
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

# Shows hidden files in autocompletion
bind 'set match-hidden-files on'



# Avoid quitting the shell when hitting CTRL+D too many times by mistake
#set -o ignoreeof

# The following do not work:
#shopt -s nocaseglob
#shopt -s extglob # necessary for bash completion (programmable completion)
#shopt -s cdspell # this will correct minor spelling errors in a cd command

if [[ -e ~/bin/ec/bashrc_ec ]] ; then
            source ~/bin/ec/bashrc_ec
fi

# Automatically start ssh-agent automatically when starting a login shell.
#eval $(ssh-agent)
if [ -z "$SSH_AUTH_SOCK" ] ; then
      eval `ssh-agent -s`
        ssh-add
    fi
