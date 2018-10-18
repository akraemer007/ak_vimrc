#!/bin/sh 
# Script to open tmux per my preferences

# check if session exists
tmux has-session -t dev
if [ $? != 0 ]
then
tmux new-session -d -s dev -n vvim
sleep 1
tmux selectp -t 1 # name pane 1
tmux send-keys "vvim" C-m

sleep 1 # give neovim enough time to fill screen

# create upper right pane w/ python 3
tmux splitw -h -p 20
tmux send-keys "py3" C-m

# create lower right pane w/ python 3 in scratch folder
tmux splitw -v
tmux send-keys "py3;cd /scratch/tf/production/" C-m

# tmux selectp -t 1 # select pane 1
fi

tmux attach -t dev
