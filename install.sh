cd ~

# .config symlinks
ln -sf $HOME/.dotfiles/.config/nvim $HOME/.config
ln -sf $HOME/.dotfiles/.config/scripts $HOME/.config

# .config scripts
chmod +x $HOME/.config/scripts/tmux-sessionizer
chmod +x $HOME/.config/scripts/tmux-startup

# HOME symlinks
ln -sf $HOME/.dotfiles/.tmux.conf $HOME
ln -sf $HOME/.dotfiles/.zshrc $HOME
ln -sf $HOME/.dotfiles/.ideavimrc $HOME

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "This is macOS."

  # install brew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # install neovim
  brew install neovim

  # install tmux
  brew install tmux
  brew install fzf
  tmux -V

  # install ripgrep
  brew install ripgrep

  # install yabai and skhd
  brew install koekeishiya/formulae/yabai
  brew install koekeishiya/formulae/skhd

  # yabai
  ln -sf $HOME/.dotfiles/.config/yabai $HOME/.config
  yabai --start-service
  yabai --restart-service

  # skhd
  ln -sf $HOME/.dotfiles/.config/skhd $HOME/.config
  skhd --start-service
  skhd --restart-service

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
  sudo apt install tmux
  sudo apt install fzf

  # Java environment setup
  sudo apt install openjdk-17-jdk
  sudo apt install maven -y

  # clipboard integration
  sudo apt install xclip xsel

  # ripgrep
  sudo apt install ripgrep

  # lazygit
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
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

# Reload .tmux.conf
tmux source-file ~/.tmux.conf 
$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh

# Reload .zshrc
source ~/.zshrc

cd .dotfiles
