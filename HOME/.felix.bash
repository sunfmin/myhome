export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export CDPATH=$GOPATH/src/github.com/theplant:$GOPATH/src/github.com/sunfmin:$GOPATH/src/github.com:$GOPATH/src/bitbucket.org/sunfmin
export APPKIT_LOG_HUMAN=true
export EDITOR="code --wait"

export HISTSIZE=500000
export HISTFILESIZE=1000000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

alias docker-rm-exited='docker ps --filter "status=exited" -q | xargs docker rm'
alias k=kubectl
alias kl=kubeless
alias less=bat
alias find=fd
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"

# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"


test -f ~/.fzf.bash && source ~/.fzf.bash
