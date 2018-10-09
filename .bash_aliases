export TERM="screen-256color"

# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
alias jp='source activate py36;  jupyter notebook --no-browser --ip=10.11.0.29 --port=8989 &'
alias tjp='tmux new -d -s jupyter; tmux send-keys -t jupyter "jp" ENTER; tmux a -t jupyter;'
alias mdb='mclient -h 10.11.0.34 -u dw -d dw'
alias mdbp='mclient -h 10.11.0.36 -u dw -d dw'
alias cpy='cd ~/other_projects/copyright_insertion/ && python insert_copyright.py'
alias py3='source activate py36'
alias vvim='nvim -u ~/ak_vimrc/.vimrc'
alias viim='set -o vi'
alias wdir='wdir=`pwd`'
alias prod_data='cd /scratch/tf/production'
alias tmux_dev='sh ~/ak_vimrc/start_tmux.sh'
# ----------------------
# Git Aliases
# ----------------------
alias ghelp='less ~/.bash_aliases'

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias glf='git log --follow -p --'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

