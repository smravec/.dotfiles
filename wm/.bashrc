#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="/home/simon/.local/bin:$PATH"
export PATH="/home/simon/Code/Bash-Scripts:$PATH"
