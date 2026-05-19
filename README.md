# Dotfiles

Personal configuration files for macOS development environment.

## Contents

- **Shell**: zsh configuration
- **Git**: git configuration
- **Vim**: vim configuration
- **Config**: Various application configs from `.config/`

## Installation

### Quick Setup

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/Development/dotfiles
cd ~/Development/dotfiles
./install.sh
```

### Manual Setup

Link individual dotfiles:

```bash
ln -sf ~/Development/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/Development/dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/Development/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/Development/dotfiles/vim/.vimrc ~/.vimrc
```

## Structure

```
dotfiles/
├── zsh/           # Zsh shell configuration
├── git/           # Git configuration
├── vim/           # Vim configuration
├── config/        # Application configs (~/.config/)
├── install.sh     # Automated setup script
├── backup.sh      # Backup existing dotfiles
└── README.md      # This file
```

## Backup

Before installation, backup your existing dotfiles:

```bash
./backup.sh
```

Backups are stored in `~/dotfiles_backup_TIMESTAMP/`.

## Updating

Pull the latest changes and run the install script:

```bash
cd ~/Development/dotfiles
git pull
./install.sh
```

## Adding New Dotfiles

1. Copy the file to the appropriate directory in this repo
2. Update `install.sh` to create the symlink
3. Commit and push

```bash
cp ~/.newconfig ~/Development/dotfiles/config/
git add config/.newconfig
git commit -m "Add .newconfig"
git push
```

