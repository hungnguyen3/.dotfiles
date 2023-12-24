# Installation

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# enable & execute install script
chmod +x install.sh
source install.sh

# reload & rebuild .tmux.config
<Ctrl-a> r
<Ctrl-a> I

# restart yabai & skhd (Mac only)
yabai --restart-service
skhd --restart-service
```

# Catppuccin iterm colors
```bash
git clone https://github.com/catppuccin/iterm
```
- Launch iTerm
- Press CMD+i (⌘+i)
- Navigate to the Colors tab
- Click on Color Presets
- Click on Import
- Navigate to the `./dotfiles/iterm/colors/` directory where the color files are located, and select the files.
- Click on Color Presets and choose the Catppuccin flavour
