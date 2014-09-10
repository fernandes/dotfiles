[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

unsetopt correct_all

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="prose"

# Set dirstack size to 8, default is 3
DIRSTACKSIZE=8

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="false"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="false"

DISABLE_AUTO_UPDATE="true"

HISTSIZE=2000
SAVEHIST=3000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler gem git osx pow rails3 ruby rvm ssh-agent)

# go go go oh my zsh!!
source $ZSH/oh-my-zsh.sh

# load my boxen env
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Load all of your zsh files from dotfiles, except those already linked from zsh folder
# set/unset extendedglob to not modify user preferences for extended globbing
#setopt extendedglob
#for config_file ($HOME/.dotfiles/**/*.zsh) source $config_file
#unsetopt extendedglob

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source ~/scripts.sh

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/Users/fernandes/.jenv/bin/jenv-init.sh" ]] && source "/Users/fernandes/.jenv/bin/jenv-init.sh" && source "/Users/fernandes/.jenv/commands/completion.sh"
