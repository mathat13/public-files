function create_script_directory() {
    # Get script name
    read -p "Enter script name: " name
    # Set script path
    script_path="$HOME/.local/scripts/$name"
    # Create script directory
    mkdir "$script_path"
    # Create script directory structure
    mkdir "$script_path/bin" "$script_path/logs"
    # Create required basic files
    touch "$script_path/bin/$name.sh" "$script_path/logs/$name.log"
    # Add executable bit and only allow user to run/ read/ write to the script
    chmod 700 "$script_path/bin/$name.sh"
    # Create symlink to .local/bin directory to run script from $PATH
    ln -s "$script_path/bin/$name.sh" "$HOME/.local/bin/$name"
    # Display directory structure with tree
    tree "$script_path"
}

function remove_script_directory() {
   # Get script name
    read -p "Enter script name: " name
    # Remove script directory
    rm -r "$HOME/.local/scripts/$name"
    # Remove symlink on $PATH
    rm "$HOME/.local/bin/$name"
}

if [[ -d "$HOME/.local/scripts" ]]; then
    create_script_directory
else
    mkdir "$HOME/.local/scripts"
    create_script_directory
fi