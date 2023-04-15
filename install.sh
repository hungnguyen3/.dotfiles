cd ~

# .config symlinks
ln -s $HOME/.dotfiles/.config/nvim $HOME/.config
ln -s $HOME/.dotfiles/.config/scripts $HOME/.config

# .config scripts
chmod +x $HOME/.config/scripts/tmux-sessionizer

# HOME symlinks
ln -s $HOME/.dotfiles/.tmux.conf $HOME
ln -s $HOME/.dotfiles/.zshrc $HOME

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "This is macOS."

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "This is Linux."
  
  # Java environment set up
  sudo apt update
  sudo apt upgrade
  sudo apt-get install tmux
  sudo apt-get install fzf
  sudo apt-get install openjdk-17-jdk
  sudo apt install maven -y
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
