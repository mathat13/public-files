#!/bin/bash

tmux new -s ansible-molecule
tmux split-pane -h
tmux resize-pane -Z -t 1


cd .ansible/collections/mathat13/role_book/
source .venv/bin/activate
cd roles/smb
