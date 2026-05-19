#!/bin/bash

# Dotfiles installation script
# Creates symlinks from home directory to dotfiles repo

set -e

DOTFILES_DIR="$HOME/Development/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Installing dotfiles..."

# Function to create symlink with backup
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ ! -L "$dest" ] || [ "$(readlink "$dest")" != "$src" ]; then
            echo "Backing up existing $dest"
            mkdir -p "$BACKUP_DIR/$(dirname "$dest")"
            mv "$dest" "$BACKUP_DIR/$dest"
        else
            echo "✓ $dest already linked correctly"
            return
        fi
    fi

    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
    echo "✓ Linked $dest → $src"
}

# Zsh
if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
fi

if [ -f "$DOTFILES_DIR/zsh/.zprofile" ]; then
    link_file "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
fi

# Git
if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
    link_file "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
fi

if [ -f "$DOTFILES_DIR/git/.gitignore_global" ]; then
    link_file "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"
fi

# Vim
if [ -f "$DOTFILES_DIR/vim/.vimrc" ]; then
    link_file "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
fi

# SSH config (if exists)
if [ -f "$DOTFILES_DIR/ssh/config" ]; then
    link_file "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"
fi

# Link .config directories (if they exist)
if [ -d "$DOTFILES_DIR/config" ]; then
    for config_dir in "$DOTFILES_DIR/config"/*; do
        if [ -d "$config_dir" ]; then
            config_name=$(basename "$config_dir")
            link_file "$config_dir" "$HOME/.config/$config_name"
        fi
    done
fi

echo ""
echo "✓ Dotfiles installation complete!"
echo ""

if [ -d "$BACKUP_DIR" ] && [ "$(ls -A "$BACKUP_DIR")" ]; then
    echo "Backups saved to: $BACKUP_DIR"
else
    [ -d "$BACKUP_DIR" ] && rmdir "$BACKUP_DIR"
fi
