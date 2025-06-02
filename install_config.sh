#!/bin/bash

set -e

# Find the base directory of the repo
pushd . >'/dev/null'
SCRIPT_PATH="${BASH_SOURCE[0]:-$0}"

while [ -h "${SCRIPT_PATH}" ]; do
    cd "$(dirname -- "$SCRIPT_PATH")"
    SCRIPT_PATH="$(readlink -f -- "$SCRIPT_PATH")"
done

cd "$(dirname -- "$SCRIPT_PATH")" >'/dev/null'
SCRIPT_PATH="$(pwd)"
popd >'/dev/null'

# Do we want graphical apps or not
XAPPS="YES"

# Check command line arguments
while [ $# -gt 0 ]; do
    case $1 in
    --no-gui)
        XAPPS=""
        ;;
    *) ;;
    esac
    shift
done

APPLICATIONS="zsh neovim mc ripgrep"
GENTOO_APPS="app-shells/zsh app-editors/neovim app-misc/mc media-gfx/imagemagick sys-apps/ripgrep"
FEDORA_APPS="${APPLICATIONS} ImageMagick"
APPLICATIONS="${APPLICATIONS} imagemagick"

if [ -n "${XAPPS}"]; then
    APPLICATIONS="${APPLICATIONS} kitty"
    GENTOO_APPS="${GENTOO_APPS} x11-terms/kitty"
fi

# Install necesary packages, if not already installed
if [ -x "$(command -v emerge)"]; then
    sudo emerge -avn ${GENTOO_APPS}
elif [ -x "$(command -v pacman)"]; then
    sudo pacman -S ${APPLICATIONS}
elif [ -x "$(command -v apt)"]; then
    sudo apt install ${APPLICATIONS}
elif [ -x "$(command -v dnf)"]; then
    sudo dnf install ${FEDORA_APPS}
else
    echo 'Error: unknown package management system' >&2
    exit 1
fi

# Set zsh as default shell
chsh -s $(which zsh)

# Install oh-my-zsh
if [ -x "$(command -v curl)"]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
elif [ -x "$(command -v wget)"]; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Symlink all configs, moving old configs away (to filename.bak_dotfile)
if [ -n "${XAPPS}"]; then
    if [ -e "~/.config/kitty"]; then
        mv ~/.config/kitty ~/.config/kitty.bak_dotfiles
    fi
    ln -s "${SCRIPT_PATH}/kitty" ~/.config/kitty
fi
if [ -e "~/.zshrc"]; then
    mv ~/.zshrc ~/.zshrc.bak_dotfiles
fi
ln -s "${SCRIPT_PATH}/zsh/.zshrc" ~/.zshrc
mkdir -p ~/.oh-my-zsh/custom/
if [ -e "~/.oh-my-zsh/custom/alias.zsh"]; then
    mv ~/.oh-my-zsh/custom/alias.zsh ~/.oh-my-zsh/custom/alias.zsh.bak_dotfiles
fi
ln -s "${SCRIPT_PATH}/oh-my-zsh/custom/alias.zsh" ~/.oh-my-zsh/custom/alias.zsh
mkdir -p ~/.config/nvim/
if [ -e "~/.config/nvim/lua"]; then
    mv ~/.config/nvim/lua ~/.config/nvim/lua.bak_dotfiles
fi
ln -s "${SCRIPT_PATH}/neovim/lua" ~/.config/nvim/lua
if [ -e "~/.config/nvim/init.lua"]; then
    mv ~/.config/nvim/init.lua ~/.config/nvim/init.lua.bak_dotfiles
fi
ln -s "${SCRIPT_PATH}/neovim/init.lua" ~/.config/nvim/init.lua

# Download fonts locally, if not installed
mkdir -p ~/.local/share/fonts/
wget -P ~/.local/share/fonts/ https://github.com/googlefonts/noto-emoji/raw/refs/heads/main/fonts/NotoColorEmoji.ttf
wget -P ~/.local/share/fonts/ https://github.com/ya2s/nonicons/raw/refs/heads/master/dist/nonicons.ttf
wget -P ~/.local/share/fonst/ https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFont-Regular.ttf
wget -P ~/.local/share/fonts/ https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/NerdFontsSymbolsOnly/SymbolsNerdFontMono-Regular.ttf
