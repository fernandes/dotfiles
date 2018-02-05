DOTFILES_ROOT=`pwd`
cd $HOME

# We recommend run these steps manually
# git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# rbenv install 2.2.2
# curl -Lo- https://bit.ly/janus-bootstrap | bash

#[ ! -d ~/.janus ] && mkdir ~/.janus
#cd ~/.janus
#git clone https://github.com/Rykka/colorv.vim.git
#git clone https://github.com/godlygeek/tabular.git
#git clone https://github.com/bling/vim-airline.git
#git clone https://github.com/quentindecock/vim-cucumber-align-pipes.git
#git clone https://github.com/tpope/vim-cucumber.git
#git clone https://github.com/rodjek/vim-puppet.git
#git clone https://github.com/ecomba/vim-ruby-refactoring.git
#git clone https://github.com/farseer90718/vim-taskwarrioraskwarrior.git
#git clone https://github.com/christoomey/vim-tmux-navigator.git
#git clone https://github.com/zertico/vim-zertico-theme.git

#wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

for file in .gitconfig .pryrc .rdebugrc .thymerc .tmux.conf .tmux-macos .tmux-linux .vimrc.before .vimrc.after .zshrc; do
  [ -e ${HOME}/${file} ] && rm -rf ${HOME}/${file}
  [ -L ${HOME}/${file} ] && rm -rf ${HOME}/${file}
  ln -ns ${DOTFILES_ROOT}/${file} $HOME/${file}
done

# copy zsh custom files
for file in fernandes.zsh superstatus.zsh; do
  zsh_file_location="${HOME}/.oh-my-zsh/custom/"
  [ -L ${zsh_file_location}/$file -o -e ${zsh_file_location}/$file ] && rm ${zsh_file_location}/$file
  ln -ns ${DOTFILES_ROOT}/zshcustom/$file ${zsh_file_location}/$file
done

# install zsh theme
[ ! -d ${HOME}/.oh-my-zsh/custom/themes ] && mkdir -p ${HOME}/.oh-my-zsh/custom/themes
[ -L ${HOME}/.oh-my-zsh/custom/themes/prose.zsh-theme -o -e ${HOME}/.oh-my-zsh/custom/themes/prose.zsh-theme ] && rm ${HOME}/.oh-my-zsh/custom/themes/prose.zsh-theme
ln -ns ${DOTFILES_ROOT}/assets/prose.zsh-theme ${HOME}/.oh-my-zsh/custom/themes/prose.zsh-theme
