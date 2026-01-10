#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias sudo='sudo-rs'

# config aliases
alias chypr='nvim ~/.config/hypr/'
alias cnvim='nvim ~/.config/nvim/'
alias cterm='nvim ~/.config/kitty/'

# power aliases
alias sdn='shutdown now'
alias rbt='reboot'

#PS1='[\u@\h \W]\$ '
PS1='\W > '
PATH=~/.local/bin:$PATH
PATH=~/.cargo/bin:$PATH
PATH=~/scripts:$PATH
export EDITOR=nvim
