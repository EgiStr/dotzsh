#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting setup...${NC}"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Update and upgrade
echo -e "${BLUE}Updating system...${NC}"
sudo apt update && sudo apt upgrade -y

# Install dependencies
echo -e "${BLUE}Installing dependencies...${NC}"
sudo apt install -y zsh curl wget git fzf bat btop build-essential

# Install eza (modern ls)
if ! command_exists eza; then
    echo -e "${BLUE}Installing eza...${NC}"
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
fi

# Install Starship
if ! command_exists starship; then
    echo -e "${BLUE}Installing Starship...${NC}"
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Install Zoxide
if ! command_exists zoxide; then
    echo -e "${BLUE}Installing Zoxide...${NC}"
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# Install Pyenv (optional, but referenced in zshrc)
if [ ! -d "$HOME/.pyenv" ]; then
    echo -e "${BLUE}Installing Pyenv...${NC}"
    curl https://pyenv.run | bash
fi

# Install NVM (optional, but referenced in zshrc)
if [ ! -d "$HOME/.config/nvm" ]; then
    echo -e "${BLUE}Installing NVM...${NC}"
    export NVM_DIR="$HOME/.config/nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"
fi

# Setup Zsh plugins
echo -e "${BLUE}Setting up Zsh plugins...${NC}"
mkdir -p "$HOME/.zsh"
[ ! -d "$HOME/.zsh/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"

# Symlink configurations
echo -e "${BLUE}Symlinking configurations...${NC}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Backup existing config
[ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)"
[ -f "$HOME/.config/starship.toml" ] && [ ! -L "$HOME/.config/starship.toml" ] && mv "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.backup.$(date +%s)"

# Link new config
ln -sf "$SCRIPT_DIR/zsh/.zshrc" "$HOME/.zshrc"
mkdir -p "$HOME/.local/bin"
ln -sf "$SCRIPT_DIR/zsh/env" "$HOME/.local/bin/env"
mkdir -p "$HOME/.config"
ln -sf "$SCRIPT_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

# Set Zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo -e "${BLUE}Changing default shell to zsh...${NC}"
    chsh -s "$(which zsh)"
fi

echo -e "${GREEN}Setup complete! Please restart your terminal.${NC}"
