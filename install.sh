shopt -s histappend # https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
brew install fzf fd rg bat entr jq slate
yes | /opt/homebrew/opt/fzf/install --no-fish --no-bash --no-update-rc
curl -fsSL https://raw.githubusercontent.com/sunfmin/myhome/master/HOME/.slate > ~/.slate
curl -fsSL https://raw.githubusercontent.com/sunfmin/myhome/master/HOME/.felix.zsh > ~/.felix.zsh
if ! grep ".felix.zsh" ~/.zshrc; then
  echo 'test -f ~/.felix.zsh && source ~/.felix.zsh' | tee -a ~/.zshrc
  echo "Added to .profile"
fi
