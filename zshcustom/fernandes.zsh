# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#

# Open my aliases
alias fshort="mate ~/.oh-my-zsh/custom/fernandes.zsh"

# My ruby/rails dev alias
alias bi="bundle install --path vendor/bundle --no-prune"
alias gem_cache="mkdir -p vendor && ln -ns ~/.cache/gems vendor/cache && mkdir -p vendor/bundle/ && ln -ns ~/.cache/gems vendor/bundle/cache"
alias pryr="pry -r ./config/environment"

# Reload zsh!
alias zsh!="source ~/.zshrc"

# git ignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# List and show oh my zsh plugin alias
psc() { [ -f ~/.oh-my-zsh/plugins/$1/$1.plugin.zsh ] && grep "^alias" ~/.oh-my-zsh/plugins/$1/$1.plugin.zsh || echo "Plugin nao existe"; }
alias pscl="ls ~/.oh-my-zsh/plugins/;"

# My custom grep and ps aux
alias fgrep="egrep -nrHi --color"
alias psgrep="ps aux | egrep -v egrep | egrep -i"

# Go home
alias h='cd ~'

# ship it!
deploy() { 
if [ -z $1 ]; then
  echo "Must specify project"
else
  cd ~/lab/deployer
  if [ -z $2 ]; then
    be cap $1:production deploy
  else
    be cap $1:production deploy:$2
  fi
fi
}

# Keep only the first host on ~/.ssh/known_hosts file
alias clean_ssh_hosts="head -2 ~/.ssh/known_hosts | tail -1 > ~/.ssh/known_hosts"

# Copy pubkey to clipboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '> Public key copied to clipboard'"
