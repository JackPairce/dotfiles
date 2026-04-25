#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# List of files/folders to link
# Format: "source_relative_to_dotfiles:target_relative_to_home"
files=(
    ".bashrc:.bashrc"
    ".bash_profile:.bash_profile"
    ".bash_logout:.bash_logout"
    ".zshrc:.zshrc"
    "aliases.sh:aliases.sh"
    ".config/mimeapps.list:.config/mimeapps.list"
    ".config/user-dirs.dirs:.config/user-dirs.dirs"
    ".config/kitty/kitty.conf:.config/kitty/kitty.conf"
    ".config/nvim:.config/nvim"
    ".config/Code/User/settings.json:.config/Code/User/settings.json"
    ".config/btop:.config/btop"
)

echo "Setting up dotfiles..."

for entry in "${files[@]}"; do
    IFS=":" read -r src target <<< "$entry"
    src_path="$DOTFILES_DIR/$src"
    target_path="$HOME/$target"

    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target_path")"

    # If target exists and is not a symlink, back it up
    if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
        echo "Backing up existing $target to $target.bak"
        mv "$target_path" "$target_path.bak"
    fi

    # Create symlink
    echo "Linking $target_path -> $src_path"
    ln -sfn "$src_path" "$target_path"
done

echo "Done!"
