# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# if you got this from the repo, remove your ~/.bashrc (or move it to some
# location for backup); then link this file there, using
#     ln -s $HOME/.config/maintenance/bashrc $HOME/.bashrc
# (replace 'config/maintenance/bashrc' with the path of this file)

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

#export RAVEPATH=~/Anwendungen/Rave/
PATH=$PATH:~/Anwendungen/Genfit/build/bin/
source ~/Anwendungen/Geant4/install/bin/geant4.sh

# The tor browser bundle requires this line:
PATH=$PATH:/usr/bin/tor-browser_de/

# Make things interactive and verbose
# see this nice video: https://www.youtube.com/watch?v=Wl7CDe9jsuo
alias mv="mv -iv"
alias cp="cp -iv"
alias mkdir="mkdir -pv" # -p for parental/recursive

# quick link to ssh (no certificate)
alias sshhg="ssh -C bielefeldt@hardgate.cb.uni-bonn.de"
alias sshhgx="sshhg -X"
alias sshrh="ssh -C bielefeldt@rihanna.cb.uni-bonn.de"
alias sshrhx="sshrh -X"

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/home/bielefeldt/Anwendungen/google-cloud-sdk/path.bash.inc' ]; then . '/home/bielefeldt/Anwendungen/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/home/bielefeldt/Anwendungen/google-cloud-sdk/completion.bash.inc' ]; then . '/home/bielefeldt/Anwendungen/google-cloud-sdk/completion.bash.inc'; fi

