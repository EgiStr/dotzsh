# Pengenalan
This is the script I use to configure my terminal.

# Configure Zsh with Oh My Zsh and Powerlevel10k theme
This is a script to configure Zsh with Oh My Zsh and the Powerlevel10k theme.
This script will remove existing Zsh configurations, download and install Oh My Zsh and the Powerlevel10k theme, change the Zsh theme to Powerlevel10k, change the terminal font to `MesloLGS NF`, and change the terminal theme to `Dracula`.

## Table of Contents
- [Prerequisites](#prerequisites)
- [How to Use This Script](#how-to-use-this-script)
- [Installation without git](#installation-without-git)
- [Notes](#notes)

## Prerequisites
- curl

## How to Use This Script

1. Save this script to a file, for example, `setup.sh`.
2. Make it executable with `chmod +x setup.sh`.
3. Run the script with `./setup.sh`.

## Installation without git

```bash
    curl -sL https://raw.githubusercontent.com/EgiStr/dotzsh/main/setup.sh > setup.sh && chmod +x setup.sh && ./setup.sh && zsh
```
## Notes

- This script has only been tested on Ubuntu.
- This script will remove existing Zsh configurations.
- This script will download and install Oh My Zsh and the Powerlevel10k theme.
- This script will change the Zsh theme to Powerlevel10k.
- This script will change the terminal font to `MesloLGS NF`.
- This script will change the terminal theme to `Dracula`.

