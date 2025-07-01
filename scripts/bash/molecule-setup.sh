#!/bin/bash

# Define default variables
SESSION_NAME="ansible-molecule"
ROLE_NAME="smb"
COLLECTION="/home/bestguy/.ansible/collections/mathat13/role_book/"

# Parse arguments
# NOTE: bash: How to parse arguments for scripts
while [[ $# -gt 0 ]]; do
  case "$1" in
    --session-name|-s)
      SESSION_NAME="$2"
      shift 2
      ;;
    --role|-r)
      ROLE_NAME="$2"
      shift 2
      ;;
    --collection|-c)
      COLLECTION="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: $0 [[--session-name|-s] session-name] [[--role|-r] role] [[--collection|-c] collection] ..."
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Create new session, starting in correct directory, detached, with correct session name
tmux new-session -c $COLLECTION -d -s $SESSION_NAME

# Split the window horizontally
tmux split-window -h

# Focus the first pane
tmux resize-pane -Z -t 1

# Activate the python virtual environment stored at the project root
# NOTE: tmux: sending commands to session
tmux send-keys -t 1 "source .venv/bin/activate" C-m

# Move to the role directory
# NOTE: bash: Concatenating strings and variables
tmux send-keys -t 1 "cd roles/${ROLE_NAME}" C-m

# Clear screen so it all looks fresh
tmux send-keys -t 1 "clear" C-m

# Attach to the session
tmux attach-session -t $SESSION_NAME

