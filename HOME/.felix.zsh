export GOPATH=$HOME/go
export Android_SDK=$HOME/Library/Android/sdk
export PATH=$GOPATH/bin:$HOME/.deno/bin:$PATH:$Android_SDK/platform-tools/
# export CDPATH=$GOPATH/src/github.com/theplant:$GOPATH/src/github.com/sunfmin:$GOPATH/src/github.com:$GOPATH/src/bitbucket.org/sunfmin
export APPKIT_LOG_HUMAN=true
export EDITOR="code --wait"

export HISTSIZE=500000
export HISTFILESIZE=1000000

transfer() {
    curl -H "Max-Downloads: 3" --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null;
    echo
}

alias transfer=transfer

alias docker-rm-exited='docker ps --filter "status=exited" -q | xargs docker rm'
alias docker-cleanup='docker rmi $(docker ps -a -q); docker image prune --force'
alias k=kubectl
alias kl=kubeless
alias less=bat
# alias find=fd
# alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias jfmt="find . -name '*.jsonnet' | xargs jsonnetfmt -i"
alias dockersnapshot="curl -fsSL https://raw.githubusercontent.com/theplant/plantbuild/master/dockercache | CMD=snapshot DIR=~/.cache bash"
alias dockerrestore="curl -fsSL https://raw.githubusercontent.com/theplant/plantbuild/master/dockercache | CMD=restore DIR=~/.cache bash"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
export HISTCONTROL=ignoredups

test -f ~/.fzf.zsh && source ~/.fzf.zsh
