# Path setup
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
export JAVA_OPTS='-Xms2000M -Xmx6000M -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:SurvivorRatio=8 -server -XX:+AggressiveOpts -XX:+UseCompressedOops'
export JAVA_TOOLS_OPTIONS="-Dfile.encoding=UTF8"
export CATALINA_OPTS="-XX:PermSize=1024m -XX:MaxPermSize=2056m -Xms512m -Xmx4000m"
export ANT_HOME='/Developer/Java/ant'

# Command tweaks
alias less="less -n"
alias ls="ls -AG"
alias ld="ls -d .*"

# Directory shortcuts
alias src="cd ~/src/; ls;"
alias docs="cd ~/Documents/"
alias downloads="cd ~/Downloads/"
alias dropbox="cd ~/Dropbox && ll"
alias sublimefolder="cd ~/Library/Application\ Support/Sublime\ Text\ 3/ && ll"
alias blog="cd ~/src/stooblog/ && ll"
alias bern="cd ~/src/Connect/ && gs"
alias dotfiles="cd ~/src/dotfiles/ && gs && ld"

# Website syncing shortcuts
alias sb="rsync -azP --delete /Users/sblair/src/stooblog/build/ stublair@stublair.co:/home4/stublair/public_html/"
alias mc="rsync -azP --delete /Users/sblair/src/lolasghost/build/ lolasgho@50.87.249.87:/home1/lolasgho/public_html/"

# CD aliases
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
function cs () { cd "$1" && ls; }

# Middleman shortcuts
alias mb="middleman build --verbose"
alias ms="middleman server --verbose"

# Other command shortcuts
alias profile="vi ~/.profile"
alias purr='afplay /System/Library/Sounds/Purr.aiff'
alias railsenv='export RAILS_ENV=development'
alias sql='sudo /usr/local/mysql/bin/mysql'
count() { find "$1" | wc -l; }


# Git command shortcuts
alias abort='git rebase --abort && gs'
alias fetch='git fetch'
alias gap='git add -p'
alias gc='git commit'
alias gcp='git cherry-pick'
alias gl='git log --stat'
alias gpr='git pull --rebase'
alias graph="git log --graph --pretty=format:'%C(yellow)%h%Creset -%Cred%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gs='git status'
alias gsl='git stash list'
alias kontinue='git rebase --continue || git cherry-pick --continue'
alias resethead='git reset --soft HEAD\^ && git status'
alias skip='git rebase --skip && gs'
alias staged='git diff --staged'
alias upstream='branch=$(git symbolic-ref HEAD | sed -e "s,.*/\(.*\),\1,") && git branch --set-upstream "$branch" origin/"$branch" && gs'
apply() { git cherry-pick "$1" && git reset HEAD\^ --soft && grh; }
contain() { contains "$1"; }
contains() { git branch --contains "$1"; }
ga() { git add "$1"; }
gb() {
  if [ -z $1 ]; then
    git branch
  else
    git checkout -b "$1"
    git status
  fi
}
gbd() { git branch -D "$1"; }
gbds() { git for-each-ref --format="%(refname:short)" refs/heads/"$1"\* | xargs git branch -D; }
gch() { git checkout "$1"; }
gcm() { git commit -m "$1"; }
gdel() { git push origin --delete "$1"; }
gpull() { git checkout -b "$1" origin/"$1"; }
grh() { git reset head "$1"; }
gsd() { git stash drop stash@{"$1"}; }
gss() { git stash save "$1"; }
investigate() { git log --follow -p "$1"; }
ours() { git checkout --ours "$1" && git add "$1" && git status; }
theirs() { git checkout --theirs "$1" && git add "$1" && git status; }
untrack() { git update-index --assume-unchanged "$1"; }

# Download entire website
downloadsite() { wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains "$1" --no-parent "$1"; }

# rvm setup
export PATH="$HOME/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/jruby/bin:$PATH"
source ~/.rvm/scripts/rvm

# Include private Cytobank-related commands
source ~/.cyto-profile
