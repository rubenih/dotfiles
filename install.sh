#!/bin/bash

echo "🚀 Starting mtn-Arch deployment..."

# 1. Install packages from your clean list
echo "📦 Installing packages..."
if [ -f paquetes.txt ]; then
    sudo pacman -S --needed - < paquetes.txt
else
    echo "❌ Error: paquetes.txt not found!"
    exit 1
fi

# 2. Create necessary directories
echo "📂 Creating config folders..."
mkdir -p ~/.config/hypr ~/.config/kitty ~/.config/waybar ~/.config/fastfetch

# 3. Create symbolic links
# Using links (ln -s) is better than copying because if you edit the 
# file in ~/.config, the version in ~/dotfiles updates automatically.
echo "🔗 Linking configuration files..."
ln -sf ~/dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sf ~/dotfiles/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -sf ~/dotfiles/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
ln -sf ~/dotfiles/hypr/wallpaper.png ~/.config/hypr/wallpaper.png
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/waybar/* ~/.config/waybar/
ln -sf ~/dotfiles/fastfetch/* ~/.config/fastfetch/
ln -sf ~/dotfiles/bash/dot-bashrc ~/.bashrc

echo "✅ Deployment finished! Please restart Hyprland."
