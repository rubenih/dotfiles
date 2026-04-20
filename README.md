# Arch Dotfiles - HP EliteBook 840 G8

Personal Arch Linux configuration using Hyprland.

## Components
- Window Manager: Hyprland
- Status Bar: Waybar (Dual bar setup)
- Terminal: Kitty
- Shell: Bash (with custom aliases)
- App Launcher: Rofi
- Notification Daemon: SwayNC

## Main Keybindings (Mod = ALT)
- Alt + Q: Terminal (Kitty)
- Alt + W: Browser (Chromium)
- Alt + E: File Manager (Dolphin)
- Alt + F: App Launcher (Rofi)
- Alt + C: Kill active window
- Alt + L: Lock screen (Hyprlock)
- Alt + M: Exit Hyprland
- Alt + V: Toggle floating mode

## Installation
1. Clone the repository:
   git clone https://github.com/YOUR_USERNAME/dotfiles.git

2. Run the installation script:
   bash install.sh

## Network and Scripts
This setup includes custom scripts for:
- Real-time network traffic monitoring in Waybar.
- Wireguard VPN status (configuration template included in the wireguard folder).
- SwayNC integration for system notifications.
