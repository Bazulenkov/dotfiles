#!/bin/bash
#
# Arch Linux Post-Install Setup Script
# Device: Xiaomi Mini PC XM22AL5N
# CPU: Intel i5-1240P (Alder Lake)
# GPU: Intel Iris Xe (integrated)
# WiFi: Intel AX211 (WiFi 6E)
# Bluetooth: Intel (integrated)
#
# Usage: Run as regular user with sudo privileges
#   chmod +x arch-setup.sh
#   ./arch-setup.sh

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

if [[ $EUID -eq 0 ]]; then
    echo "Do not run as root. Run as regular user with sudo."
    exit 1
fi

# ============================================================
# 1. System packages
# ============================================================
info "Installing system packages..."

if ! ping -c1 archlinux.org &>/dev/null; then
    echo "No internet connection"; exit 1
fi

info "Enabling NTP time synchronization..."
sudo timedatectl set-ntp true

sudo pacman -S --needed --noconfirm \
    base-devel nvim stow \
    zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions starship \
    bluez bluez-utils \
    mesa intel-media-driver vulkan-intel vulkan-tools libva-utils \
    pipewire pipewire-pulse pipewire-alsa wireplumber alsa-utils \
    git rust \
    man-db man-pages

# ============================================================
# 1.2. Install fonts
# ============================================================

sudo pacman -S --needed --noconfirm \
    ttf-jetbrains-mono-nerd \
	otf-font-awesome \
	noto-fonts noto-fonts-emoji \
	ttf-liberation

# ============================================================
# 1.3. Install modern utilities
# ============================================================

sudo pacman -S eza bat fd ripgrep zoxide dust procs sd git-delta

# ============================================================
# 2. WiFi: disable power saving (Intel AX211 bug fix)
# ============================================================
info "Configuring WiFi power saving fix..."
sudo tee /etc/modprobe.d/iwlwifi.conf > /dev/null << 'EOF'
options iwlwifi power_save=0
options iwlmvm power_scheme=1
EOF

# ============================================================
# 3. WiFi: regulatory domain Spain
# ============================================================
info "Setting WiFi regulatory domain to ES..."
sudo tee /etc/modprobe.d/cfg80211.conf > /dev/null << 'EOF'
options cfg80211 ieee80211_regdom=ES
EOF

# ============================================================
# 4. Bluetooth
# ============================================================
info "Enabling Bluetooth..."
sudo systemctl enable bluetooth
sudo sed -i 's/^#AutoEnable=true/AutoEnable=true/' /etc/bluetooth/main.conf

# ============================================================
# 5. PipeWire
# ============================================================
info "Enabling PipeWire user services..."
systemctl --user enable pipewire pipewire-pulse wireplumber

# ============================================================
# 6. Dotfiles (stow)
# ============================================================
DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_REPO="git@github.com:Bazulenkov/dotfiles.git"

if [[ -d "$DOTFILES_DIR" ]]; then
    info "Dotfiles directory already exists, pulling latest..."
    git -C "$DOTFILES_DIR" pull
else
    info "Cloning dotfiles..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

info "Stowing dotfiles..."
cd "$DOTFILES_DIR"
stow -v zsh git hypr

if [[ "$SHELL" != */zsh ]]; then
    chsh -s /usr/bin/zsh
fi

# ============================================================
# 7. Install paru (AUR helper)
# ============================================================
if ! command -v paru &> /dev/null; then
    info "Installing paru..."
    BUILDDIR=$(mktemp -d "$HOME/paru-build.XXXXXX")
    git clone https://aur.archlinux.org/paru.git "$BUILDDIR/paru"
    cd "$BUILDDIR/paru"
    makepkg -si --noconfirm
    cd ~
    rm -rf "$BUILDDIR"
else
    info "paru already installed, skipping."
fi

# ============================================================
echo ""
info "Setup complete! Reboot recommended: sudo reboot"
warn "After reboot:"
echo "  - WiFi power saving fix active"
echo "  - Bluetooth starts automatically"
echo "  - PipeWire starts on local login"
