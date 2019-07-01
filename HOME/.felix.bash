export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$HOME/.deno/bin:$PATH
export CDPATH=$GOPATH/src/github.com/theplant:$GOPATH/src/github.com/sunfmin:$GOPATH/src/github.com:$GOPATH/src/bitbucket.org/sunfmin
export APPKIT_LOG_HUMAN=true
export EDITOR="code --wait"

export HISTSIZE=500000
export HISTFILESIZE=1000000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

alias docker-rm-exited='docker ps --filter "status=exited" -q | xargs docker rm'
alias docker-cleanup='docker rmi $(docker ps -a -q); docker image prune --force'
alias k=kubectl
alias kl=kubeless
alias less=bat
# alias find=fd
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias jfmt="find . -name '*.jsonnet' | xargs jsonnet fmt -i"
alias dockersnapshot="curl -fsSL https://raw.githubusercontent.com/theplant/plantbuild/master/dockercache | CMD=snapshot DIR=~/.cache bash"
alias dockerrestore="curl -fsSL https://raw.githubusercontent.com/theplant/plantbuild/master/dockercache | CMD=restore DIR=~/.cache bash"
alias cleanhistory="awk '!x[$0]++' ~/.bash_history > ~/.cleaned_bash_history && cp ~/.cleaned_bash_history ~/.bash_history"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"


test -f ~/.fzf.bash && source ~/.fzf.bash
