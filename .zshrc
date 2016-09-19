PROMPT="%F{green}%m%#%f "

# History

HISTFILE=$HOME/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Basic

alias ls="ls -G"
alias diff="colordiff"
alias less="less -R"

# peco-history-search
function peco-select-history() {
	BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
	CURSOR=$#BUFFER
	zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# peco-kill

function peco-pkill() {
	for pid in `ps aux | peco | awk '{ print $2 }'`
	do
		kill $pid
		echo "Killed ${pid}"
	done
}
alias pk="peco-pkill"

# Go

export GOPATH=~/dev
export PATH=$PATH:$GOPATH/bin
alias gcd="cd $GOPATH"

# Travis CI
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# SDKMAN
export SDKMAN_DIR=~/.sdkman
[ -f ~/.sdkman/bin/sdkman-init.sh ] && source ~/.sdkman/bin/sdkman-init.sh
