shopt -s histappend # https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
brew install fzf fd rg bat entr prettyping jq
yes | /usr/local/opt/fzf/install --no-fish --no-zsh --no-update-rc
curl -fsSL https://raw.githubusercontent.com/sunfmin/myhome/master/HOME/.slate > ~/.slate
curl -fsSL https://raw.githubusercontent.com/sunfmin/myhome/master/HOME/.felix.bash > ~/.felix.bash
if ! grep ".felix.bash" ~/.profile; then
  echo 'test -f ~/.felix.bash && source ~/.felix.bash' | tee -a ~/.profile
  echo "Added to .profile"
fi

sudo curl -fsSL https://raw.githubusercontent.com/sunfmin/myhome/master/etc/hosts > /etc/hosts
