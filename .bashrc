#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin

# less colors for man pages
man () {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;33m\][\[\e[0m\]\
\[\e[1;31m\]\w\[\e[0m\]\
\[\e[1;33m\]]\$ \[\e[0m\]'

alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias e="emacs -nw"
alias emacs="emacs -nw"
alias v="vim"
alias gcl="git config --list"
alias gcg="git config --global"
alias gpo="git push origin"
