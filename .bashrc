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
alias ll='ls -alhF'
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

#rootana
export ROOTANASYS=/home/hershen/rootana
export LD_LIBRARY_PATH=${ROOTANASYS}/lib:$LD_LIBRARY_PATH

#catch2 - unit tests
export CPLUS_INCLUDE_PATH=/home/hershen/Catch2/single_include:$CPLUS_INCLUDE_PATH

#VMC
export NO_G3TOG4=1

#Shared library path
export LD_LIBRARY_PATH=/home/hershen/PhD/Root/commonRootFunctions/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/home/hershen/PhD/Root/commonRootFunctions/lib:$LIBRARY_PATH

#python startup script
# export PYTHONSTARTUP=~/.pystartup

#set python path
export PYTHONPATH=${PYTHONPATH}:/home/hershen/PhD/Root/commonPythonFunctions:/home/hershen/PhD/python:/home/hershen/PhD/Root/commonRootFunctions/pythonBindings/lib

alias clumeqConnect='ssh guillimin6.hpc.mcgill.ca'
alias clumeqMount="sshfs hershen@guillimin.hpc.mcgill.ca:/home/hershen ~/clumeqMount -oauto_cache,reconnect" #,defer_permissions
alias clumeqUnmount="fusermount -u /home/hershen/clumeqMount"
alias upgrade="sudo apt-get update && sudo apt-get upgrade"
alias root="root -l"
alias hyper='ssh -X hyper.phas.ubc.ca'
alias desy='ssh naf-belle11.desy.de'
alias daq10='ssh belle2@daq10.triumf.ca'
alias desyMount="sshfs hershen@naf-belle11.desy.de:/afs/desy.de/user/h/hershen ~/desyMount -oauto_cache,reconnect" #,defer_permissions
alias desyUnmount="fusermount -u /home/hershen/desyMount"
alias ltdaMount="sshfs hershen@bbrltda03.slac.stanford.edu:/awg/tauqed/hershen ~/tauqed -oauto_cache,reconnect"
alias ltdaUnmount="fusermount -u /home/hershen/tauqed"
alias seagateRemount="sudo mount -o remount,ro /dev/sdb1 /media/hershen/Seagate/"
alias webstorm="/home/hershen/WebStorm/WebStorm-173.4127.31/bin/webstorm.sh &"
alias ltda="ssh bbrltda.slac.stanford.edu"
alias rhel="ssh rhel6-64j.slac.stanford.edu"

#setup root
# source ~/root/root-6.06.06/bin/thisroot.sh

function basf2Setup()
{
  pushd .
  alias python='python2'
  cd /home/hershen/basf2/release
  source ../tools/b2setup
  unalias python
  popd
  export PYTHONPATH=$PYTHONPATH:/home/hershen/PhD/python:/home/hershen/PhD/Root/commonRootFunctions/pythonBindings/lib
}
export -f basf2Setup


function myScons()
{
  local returnVal="scons $1"
  if [[ "$returnVal" ]]; then
    scons -Q
  fi
}

function killMouse()
{
  ps axjf | grep drag
}

function myRsync()
{
  #a - archive mode
  #v - verbose
  #z - use compression while transfering
  #P - don't delete partial files if interupted (faster transfer if resumed) + display progress.
  echo rsync''ing from $1 to $2
	rsync -avzP $1 $2

}

# added by Anaconda3 4.1.1 installer
# export PATH="/home/hershen/anaconda3/bin:$PATH"

#Add webstrom to path

#Auto commit tiddly notebook on write - Doesn't work because windows shared folder doesn't trigger events.
# nohup inotifywait -q -m -e modify /home/hershen/PhD/tiddly/notebook.html | cd /home/hershen/PhD/tiddly; git add notebook.html; git commit -m 'autocommit on change'  &
export PATH="/home/hershen/WebStorm/bin:$PATH"
#use clang static analyzer:
function cm() {
  scan-build -o clangCheckOutput make
}

#colorful GCC outputs
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


function geant4Local() {
	basf2Setup
  source /home/hershen/geant4/geant4.10.3-install/bin/geant4.sh
#   source /home/hershen/basf2/externals/v01-04-01/Linux_x86_64/opt/root/bin/thisroot.sh
}

#create symbolic link to external Seagate with testbeam data
ln -s /media/hershen/Seagate/beamTest2015/originalMidasFiles/ /home/hershen/Seagate

#set directory colors for shared foladers
LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS

# added by Anaconda3 installer
export PATH="$PATH:/home/hershen/anaconda3/bin"

#kill plasmashell
alias killPlasma="killall plasmashell; kstart plasmashell --shut-up; exit"


#jupyter notebook strip - makes it git friendly (http://timstaley.co.uk/posts/making-git-and-jupyter-notebooks-play-nice/)
alias nbstrip_jq="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}}'"

#Run nbstrip_jq on all jupyter notebooks
function nbstrip_all {
    for nbfile in *.ipynb; do
	echo "Processing $nbfile"
        echo "$(nbstrip_jq $nbfile)" > $nbfile
    done
    unset nbfile
}
