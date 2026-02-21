#!/usr/bin/env bash
set -euo pipefail

echo "==> Detecting OS..."
if [[ "$(uname)" == "Darwin" ]]; then
    echo "==> macOS detected"

    if ! command -v brew &>/dev/null; then
        echo "==> Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    echo "==> Installing dependencies..."
    brew install go-task stow fish kitty
else
    echo "==> Linux/WSL detected"

    echo "==> Installing dependencies..."
    sudo apt update && sudo apt install -y stow fish

    if ! command -v task &>/dev/null; then
        echo "==> Installing go-task..."
        sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
    fi
fi

echo "==> Installing devbox..."
if ! command -v devbox &>/dev/null; then
    curl -fsSL https://get.jetify.com/devbox | bash
fi

echo "==> Symlinking dotfiles..."
cd "$(dirname "$0")"
stow fish git kitty devbox

echo "==> Done! Restart your shell or run: exec fish"
