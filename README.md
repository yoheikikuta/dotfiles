# dotfiles

Nix-based dotfiles for macOS (nix-darwin + home-manager).

## Setup from scratch

### 1. Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### 2. Clone this repo

```sh
git clone https://github.com/yoheikikuta/dotfiles.git
cd dotfiles
```

### 3. Install nix-darwin (first time only)

```sh
sudo nix run nix-darwin -- switch --flake .
```

### 4. Subsequent updates

```sh
sudo darwin-rebuild switch --flake .
```

## What's managed

| Tool | Method |
|------|--------|
| git | Nix (home-manager) |
| claude-code | Nix (home-manager) |
| Google Chrome | Homebrew cask |
| VSCode | Homebrew cask |
| 1Password | Homebrew cask |
| Codex | Homebrew formula |

## Adding a new machine

Add a new entry in `flake.nix` under `darwinConfigurations` with the machine's hostname (`hostname -s`).
