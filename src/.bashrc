
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

# utils aliases
alias ls='ls -a --color=auto'
alias lsa='ls -a --color=auto . *'
alias grep='grep --color=auto'
alias wp='. waypoint'

alias ascii='jp2a --colors -c ~/.config/kitty/images/blindseer.png'
# config aliases
alias chypr='nvim ~/.config/hypr/'
alias cnvim='nvim ~/.config/nvim/'
alias cterm='nvim ~/.config/kitty/'

# power aliases
alias sdn='shutdown now'
alias rbt='reboot'

# prompt
PS1=' \W > '

# path setting
PATH=~/.local/bin:$PATH
PATH=~/.cargo/bin:$PATH
PATH=~/scripts:$PATH

ascii
