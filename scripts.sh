export MARKPATH=$HOME/.marks
function jump {
  cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
  rm -i $MARKPATH/$1
}
function marks {
  ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}


# identify and search for active network connections
spy () { lsof -i -P +c 0 +M | grep -i "$1" }

# history-search
alias hs='history | grep --color=auto'

# Open github web page of current git repo
alias github="chrome \`git remote -v | grep github.com | grep fetch | head -1 | field 2 | sed 's/git:/http:/g'\`"

# Undo an unzip
function undozip(){
  unzip -l "$1" |  awk 'BEGIN { OFS="" ; ORS="" } ; { for ( i=4; i<NF; i++ ) print $i " "; print $NF "\n" }' | xargs -I{} rm -r {}
}

function stats () {
  if [ ! $1 ] || [ $1 == '-a' ]; then
    perl -ne 'chomp(); $sum += $_; ++$n; END { printf "$n\t$sum\t%.2e\n", $sum/$n }'
  elif [ $1 == '-m' ]; then
    perl -ne 'chomp(); $sum += $_; ++$n; END { printf "%.2e\n", $sum/$n }'
  elif [ $1 == '-s' ]; then
    perl -lne 'chomp(); $sum += $_; ++$n; END { print $sum }'
  fi
}

alias netlisteners='lsof -i -P | grep LISTEN'

function ban() {
  if [ "`id -u`" == "0" ] ; then
    iptables -A INPUT -s $1 -j DROP
  else
    sudo iptables -A INPUT -s $1 -j DROP
  fi
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

sssh (){ ssh -t "$1" 'tmux attach || tmux new || screen -DR'; }

alias freq='cut -f1 -d" " ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30'
alias glo="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias railsdebugfind='egrep --exclude-dir=vendor --exclude-dir=tmp --exclude-dir=log "(binding.pry)|(console.log\(.+\))|(alert\(.+\))" -inR *'
alias shl="source-highlight -o STDOUT -f esc -i /dev/stdin -s"
