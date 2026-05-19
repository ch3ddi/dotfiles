# Dotfiles Repository

This repository manages personal configuration files (dotfiles) for a macOS development environment.

## Purpose

Dotfiles repositories allow developers to:
- Version control their configuration files
- Share configurations across multiple machines
- Easily restore settings on new systems
- Track changes to configurations over time

## Structure

- **zsh/**: Shell configuration files (.zshrc, .zprofile)
- **git/**: Git configuration (.gitconfig, .gitignore_global)
- **vim/**: Vim editor configuration (.vimrc)
- **config/**: Application-specific configs from ~/.config/
- **ssh/**: SSH configuration (config file only, never keys)

## Installation

The `install.sh` script creates symlinks from the home directory to files in this repo. This means:
- Editing files in the repo updates the active configuration
- Changes can be committed and synced across machines
- Original files are backed up before linking

## Best Practices

1. **Never commit secrets**: Use .gitignore to exclude sensitive files
2. **Document changes**: Use clear commit messages
3. **Test before committing**: Ensure configs work before pushing
4. **Keep it minimal**: Only track files you actually customize
5. **Sensitive data**: Use separate local config files (e.g., .gitconfig.local)

## Common Dotfiles to Track

- Shell: .zshrc, .bashrc, .zprofile, .bash_profile
- Git: .gitconfig, .gitignore_global
- Editors: .vimrc, .emacs
- Tools: .tmux.conf, .curlrc
- Application configs: ~/.config/* directories
