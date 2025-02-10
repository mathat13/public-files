function create_script_directory() {
    # Get script name
    read -p "Enter script name: " name
    # Create script directory
    mkdir "$HOME/.local/scripts/$name"
    # Create script directory structure
    mkdir "$HOME/.local/scripts/$name/bin" "$HOME/.local/scripts/$name/logs"
    # Create required basic files
    touch "$HOME/.local/scripts/$name/bin/$name.sh" "$HOME/.local/scripts/$name/logs/$name.log"
    tree "$HOME/.local/scripts/$name"
}

if [[ -d "$HOME/.local/scripts" ]]; then
    create_script_directory
else
    mkdir "$HOME/.local/scripts"
    create_script_directory
fi