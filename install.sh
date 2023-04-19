cd ~

# .config symlinks
ln -sf $HOME/.dotfiles/.config/nvim $HOME/.config
ln -sf $HOME/.dotfiles/.config/scripts $HOME/.config

# .config scripts
chmod +x $HOME/.config/scripts/tmux-sessionizer

# HOME symlinks
ln -sf $HOME/.dotfiles/.tmux.conf $HOME
ln -sf $HOME/.dotfiles/.zshrc $HOME

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "This is macOS."

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "This is Linux."
  
  sudo apt update
  sudo apt upgrade

  # download node & npm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
  source ~/.zshrc
  nvm install --lts
  nvm alias default 'lts/*'
  node --version
  sudo apt install npm

  # tmux setup
  sudo apt-get install tmux
  sudo apt-get install fzf

  # Java environment setup
  sudo apt-get install openjdk-17-jdk
  sudo apt install maven -y

  # clipboard integration
  sudo apt-get install xclip xsel

  # ripgrep
  sudo apt-get install ripgrep
else
  echo "Unknown operating system."
fi

# For all systems
tpm_directory="$HOME/.tmux/plugins/tpm"

if [ ! -d "$tpm_directory" ]; then
    echo "TPM directory not found. Cloning the repository..."
    git clone https://github.com/tmux-plugins/tpm "$tpm_directory"
else
    echo "TPM directory already exists. Skipping clone."
fi

source ~/.zshrc
