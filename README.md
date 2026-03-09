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

### 5. SSH key setup (after 1Password sign-in)

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
| Google Chrome | Homebrew cask |
| VSCode | Homebrew cask |
| 1Password | Homebrew cask |
| Codex App | Homebrew cask |

## Adding a new machine

Add a new entry in `flake.nix` under `darwinConfigurations` with the machine's hostname (`hostname -s`).
