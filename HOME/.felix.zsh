export GOPATH=$HOME/go
export Android_SDK=$HOME/Library/Android/sdk
export PATH=$GOPATH/bin:$HOME/.deno/bin:$PATH:$Android_SDK/platform-tools/
# export CDPATH=$GOPATH/src/github.com/theplant:$GOPATH/src/github.com/sunfmin:$GOPATH/src/github.com:$GOPATH/src/bitbucket.org/sunfmin
export APPKIT_LOG_HUMAN=true
export EDITOR="code --wait"

export HISTSIZE=500000
export HISTFILESIZE=1000000

function transfer() {
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

function remove_video_part() {
    FROM=$1
    TO=$2
    FILE=$3
    if [ -z "$FILE" ]
    then
        echo "usage: ./remove_video_part.sh 01:16:00 01:17:20 \"abc.mp4\""
        exit 1
    fi

    ffmpeg -to $FROM -i "$FILE" \
        -ss $TO -i "$FILE" \
        -map 0:v -map 0:a -c copy _rvp_part1.ts \
        -map 1:v -map 1:a -c copy _rvp_part2.ts
    ffmpeg -i 'concat:_rvp_part1.ts|_rvp_part2.ts' -c copy _rvp_removed.ts
    ffmpeg -i _rvp_removed.ts -c copy "$FILE"_removed.mp4
    rm _rvp_*.ts
}

alias remove_video_part=remove_video_part

test -f ~/.fzf.zsh && source ~/.fzf.zsh
