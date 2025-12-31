# Dotfiles Configuration

This repository contains my personal Linux terminal configuration, structured for easy reproduction and management.

## Structure

- **zsh/**: Contains Zsh configuration files.
  - `.zshrc`: Main Zsh configuration file.
  - `env`: Environment variables and PATH configuration (linked to `~/.local/bin/env`).
- **starship/**: Contains Starship prompt configuration.
  - `starship.toml`: Custom Starship configuration.
- **setup.sh**: Automated setup script to install dependencies and link configurations.

## Prerequisites

- Ubuntu/Debian-based Linux distribution (script uses `apt`).
- `curl`, `git` (installed by script if missing).

## Installation

To reproduce this configuration on a new machine:

1.  Clone this repository:
    ```bash
    git clone https://github.com/EgiStr/dotzsh.git
    cd dotzsh
    ```

2.  Run the setup script:
    ```bash
    chmod +x setup.sh
    ./setup.sh
    ```

3.  Restart your terminal or log out and log back in.

## Features

- **Shell**: Zsh
- **Prompt**: Starship
- **Plugins**:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
- **Tools**:
  - `zoxide` (smarter cd)
  - `eza` (modern ls)
  - `bat` (modern cat)
  - `btop` (modern top)
  - `fzf` (fuzzy finder)
- **Version Managers**:
  - `pyenv` (Python)
  - `nvm` (Node.js)

## Manual Management

The configuration files are symlinked to their respective locations in the home directory. Any changes made to the files in this repository will be reflected immediately.

- `~/.zshrc` -> `./zsh/.zshrc`
- `~/.local/bin/env` -> `./zsh/env`
- `~/.config/starship.toml` -> `./starship/starship.toml`

