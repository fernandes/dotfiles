# Its called prose because its based on prose theme
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#screenshots
# it was heavly changed, but kept prose name as a tribute

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '○' && return
  echo '$'
}

function ruby_status {
  ruby_version=`ruby -v|cut -d" " -f1-2`
  rbenv_version=`rbenv version-name`
  rbenv_set_by=`rbenv version|cut -d" " -f4|cut -d")" -f1`
  egrep -q "$HOME.*/.ruby-version" << EOF
$rbenv_set_by
EOF
  [ $? -eq 0 ] && rbenv_set_by='.ruby-version'
  rbenv_set_by=${rbenv_set_by/$PWD\/./}
  if [ $rbenv_version = 'system' ]; then
    echo "using %F{162}${ruby_version} %F{255}(%F{162}${rbenv_version}%F{255})%{$reset_color%}"
  else
    echo "using %F{162}${ruby_version} %F{255}(%F{162}${rbenv_set_by}%F{255})%{$reset_color%}"
  fi
}


PROMPT='%F{162}%n%{$reset_color%} at %F{208}$(box_name)%{$reset_color%} in %F{78}~%{$reset_color%} $(ruby_status) $(git_super_status)
○ '
