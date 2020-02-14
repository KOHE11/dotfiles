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

# ROS設定用
#source /opt/ros/dashing/setup.bash # ROS2 Dashing Diademata
source /opt/ros/melodic/setup.bash  # ROS Melodic Morenia

# キーバインドの変更-----------------------------------------------------------------------------------

# Caps LockをEnterに
xmodmap -e 'clear lock'
xmodmap -e 'keycode 66 = Return NoSymbol Return' # もとは Eisu_toggle Caps_Lock Eisu_toggle Caps_Lock

# 変換をBackSpceに
xmodmap -e 'keycode 100 = BackSpace BackSpace BackSpace BackSpace' # もとは  Henkan_Mode NoSymbol Henkan_Mode

# 「カタカナひらがなローマ字」を半角/全角漢字」に
xmodmap -e 'keycode 101 = Zenkaku_Hankaku Kanji grave asciitilde' # もとは Hiragana_Katakana Romaji Hiragana_Katakana Romaji

# 無変換をEnterに
xmodmap -e 'keycode 102 = Return NoSymbol Return'
# aliasの設定-------------------------------------------------------------------------------------------

# 基本コマンド
alias show='evince'
alias jn='jupyter notebook'
alias findn='sudo find / -name'
alias cdu='cd ..'
alias rmrf='rm -rf'
alias sr='source'
alias srbash='source ~/.bashrc'
alias cl='clear'
alias :q='exit'
alias sou='play'
alias sdown='shutdown -h now'
alias pip3freeze='pip3 freeze > requirements.txt'
alias vimbashrc='vim ~/.bashrc'
alias vimvimrc='vim ~/.vimrc' 

# Git
alias g='git'
alias gclo='git clone'
alias ga='git add'
alias gc='git commit -m'
alias gpu='git push origin'
alias gpul='git pull origin'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log'
alias gd='git diff'
alias gs='git status'
alias gss='git stash save'
alias gsl='git stash list'
alias gsc='git stash clear'
alias gsa='git stash apply stash@'

# プログラミング言語
alias gpp='g++'
alias ao='./a.out'
alias py='python3'

# ROS2用
alias cb='colcon build'
alias srinst='source install/setup.bash'
