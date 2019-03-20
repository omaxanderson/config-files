export PATH=/usr/bin:$PATH

#export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[    \e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\] "

export CLICOLOR="gxfxcxdxbxegedabagacad"
  
# A few different alias's to shorten commonly used commands
alias ll='ls -la'
alias la='ls -a'
alias reload='source ~/.bash_profile'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\[\e[0;32m omax:\e[m \e[1;36m\w\e[0;31m\$(parse_git_branch) \e[m\e[1;36m$\e[m\] "
export PS1="\[\033[0;32m\] omax\[\033[0m\]:\[\033[0;96m\]\w\[\033[0m\]\[\033[0;31m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH=$HOME/bin:$PATH

# fuzzy finder default options
export FZF_DEFAULT_OPTS='--height 40% --border'
export FZF_COMPLETION_TRIGGER=','

alias vif='vi $(fzf)'
