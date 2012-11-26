HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify prompt_subst
bindkey -e
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
autoload -U colors
colors

export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin
source ~/.git-prompt.sh

#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"
PROMPT="%{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# "
RPROMPT='%{$fg[blue]%}$(__git_ps1) %{$reset_color%}[%{$fg_no_bold[red]%}%?%{$reset_color%}]'

alias e="emacs -nw"
alias gitcl="git config --list"
alias gitcm="git commit -m"
alias gitpo="git push origin"
alias ls="ls --color=auto"
alias pacqs="pacman -Qs"
alias pacs="sudo pacman -S"
alias pacsi="pacman -Si"
alias pacss="pacman -Ss"
alias sz="source ~/.zshrc"
alias v="vim"
alias va="vim ~/.config/awesome/rc.lua"
alias vz="vim ~/.zshrc"
