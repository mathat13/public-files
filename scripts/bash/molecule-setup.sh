#!/bin/bash

# Define default variables
SESSION_NAME="ansible-molecule"
ROLE_NAME="smb"
COLLECTION="/mnt/c/Users/liljo/repos/ansible_collections/mathat13/server_builder"

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

# Check if the session already exists 
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Session $SESSION_NAME already exists. Attaching to it."
    tmux attach-session -t $SESSION_NAME
else
  # Create new session, starting in correct directory, detached, with correct session name
  tmux new-session -c $COLLECTION -d -s $SESSION_NAME

  # Split the window horizontally
  tmux split-window -h

  # Focus the first pane
  tmux resize-pane -Z -t 1

  # Activate the python virtual environment stored at the project root
  # NOTE: tmux: sending commands to session
  tmux send-keys -t 1 "source ~/.ansible/.venv/bin/activate" C-m

  # Move to the role directory
  # NOTE: bash: Concatenating strings and variables
  tmux send-keys -t 1 "cd roles/${ROLE_NAME}" C-m

  # Clear screen so it all looks fresh
  tmux send-keys -t 1 "clear" C-m
  
  # Check for docker presence
  if ! command -v docker >/dev/null 2>&1
    then
      tmux send-keys -t 1 "echo 'docker could not be found.'" C-m
  else
      tmux send-keys -t 1 "echo 'docker found.'" C-m
  fi

  # Attach to the session
  tmux attach-session -t $SESSION_NAME
  
fi



