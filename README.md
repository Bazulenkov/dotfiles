# dotfiles

Personal dotfiles for Arch Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Contents |
|---------|----------|
| `zsh`   | `.zshrc` |
| `git`   | `.config/git/config` |
| `hypr`  | `.config/hypr/hyprland.conf` |

## Dependencies

```bash
sudo pacman -S stow git zsh eza bat dust procs git-delta zoxide starship zsh-autosuggestions zsh-syntax-highlighting
```

## Setup

```bash
# Clone the repo
git clone git@github.com:bazulenkov/dotfiles.git ~/dotfiles

# Apply all packages
cd ~/dotfiles
stow zsh git hypr
```

## Arch Linux Setup Script

`arch-setup-XM22AL5N.sh` — post-install script for Xiaomi Mini PC (Intel i5-1240P, AX211 WiFi).

Installs system packages, configures WiFi/Bluetooth/PipeWire, clones this repo, and stows dotfiles.

```bash
chmod +x arch-setup-XM22AL5N.sh
./arch-setup-XM22AL5N.sh
```

## Git — private config

User credentials are stored locally and not tracked by the repo:

```bash
cat > ~/.config/git/config.local << 'EOF'
[user]
    name = Your Name
    email = your@email.com
EOF
```

## Useful commands

```bash
stow <pkg>        # create symlinks
stow -D <pkg>     # remove symlinks
stow -R <pkg>     # restow (remove + create)
stow -n -v <pkg>  # dry run
```
