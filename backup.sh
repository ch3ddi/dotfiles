#!/bin/bash

# Backup existing dotfiles before installation

BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Backing up existing dotfiles to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# List of files to backup
files=(
    ".zshrc"
    ".zprofile"
    ".gitconfig"
    ".gitignore_global"
    ".vimrc"
)

for file in "${files[@]}"; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$BACKUP_DIR/"
        echo "✓ Backed up $file"
    fi
done

# Backup .ssh/config
if [ -f "$HOME/.ssh/config" ]; then
    mkdir -p "$BACKUP_DIR/.ssh"
    cp "$HOME/.ssh/config" "$BACKUP_DIR/.ssh/"
    echo "✓ Backed up .ssh/config"
fi

echo ""
echo "✓ Backup complete: $BACKUP_DIR"
