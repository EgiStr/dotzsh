#!/bin/bash

# Install Zsh
sudo apt install zsh -y

# Install Oh My Zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Set ZSH_CUSTOM
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Install Powerline fonts
sudo apt install powerline fonts-powerline -y 
mkdir -p ~/.local/share/fonts                                 
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf


# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM}/plugins/zsh-history-substring-search"

# Install additional tools
sudo apt install thefuck autojump fzf  -y

# 


# Enable nvm plugin autoload
sed -i '1s/^/zstyle '"'"':omz:plugins:nvm'"'"' autoload yes\n/' ~/.zshrc

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Move .zcompdump to cache directory
sed -i -e '/source $ZSH\/oh-my-zsh.sh/i export ZSH_COMPDUMP=$ZSH\/cache\/.zcompdump-$HOST' ~/.zshrc

# Configure plugins in .zshrc
sed -i 's/^plugins=.*/plugins=(git node extract thefuck autojump jsontools colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search nvm debian z fzf docker-compose docker vscode copyfile dotenv)/g' ~/.zshrc

# Configure default ZSH for new users
sudo cp ~/.zshrc /etc/skel/
sudo cp ~/.p10k.zsh /etc/skel/
sudo cp -r ~/.oh-my-zsh /etc/skel/
sudo chmod -R 755 /etc/skel/
sudo chown -R root:root /etc/skel/

# Set Zsh as default shell
chsh -s $(which zsh)


echo "Zsh setup complete. Please log out and log back in to start using Zsh."