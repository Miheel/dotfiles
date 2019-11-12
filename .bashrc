#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#pywal
cat /home/leuf/.cache/wal/sequences &

neofetch

alias c='clear'
alias li='ls -lh'
alias la='ls -lha'
alias v='nvim'
alias pls='sudo'
alias ba='cd ../'
alias home='cd $HOME'
