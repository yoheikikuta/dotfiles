# dotfiles

Nix-based dotfiles for macOS (nix-darwin + home-manager).

## Setup from scratch

### 1. Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### 3. Clone this repo

```sh
git clone https://github.com/yoheikikuta/dotfiles.git
cd dotfiles
```

### 4. Install nix-darwin (first time only)

If the hostname (`hostname -s`) differs from `Yoheis-MacBook-Air`, add a new entry in `flake.nix` under `darwinConfigurations` first.

```sh
sudo nix run nix-darwin -- switch --flake .
```

### 5. Subsequent updates

```sh
sudo /run/current-system/sw/bin/darwin-rebuild switch --flake .
```

### 6. SSH key setup (after 1Password sign-in)

SSH authentication and commit signing are managed via 1Password SSH agent.

1. Open 1Password → Settings → Developer → enable **SSH Agent**
2. Import your SSH key into 1Password (New item → SSH Key)
3. Register the public key on GitHub:
   - **Authentication Key**: Settings → SSH and GPG keys → New SSH key
   - **Signing Key**: Settings → SSH and GPG keys → New SSH key (Key type: Signing Key)

Once done, SSH access and signed commits work automatically.

## What's managed

| Tool | Method |
|------|--------|
| git (config + commit signing) | Nix (home-manager) |
| claude-code | Nix (home-manager) |
| SSH config (1Password agent) | Nix (home-manager) |
| VSCode (settings + extensions) | Nix (home-manager) |
| Google Chrome | Homebrew cask |
| VSCode app | Homebrew cask |
| 1Password | Homebrew cask |
| Codex App | Homebrew cask |
| Raycast | Homebrew cask |

## Adding a new machine

Add a new entry in `flake.nix` under `darwinConfigurations` with the machine's hostname (`hostname -s`).
