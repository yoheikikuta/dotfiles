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

### 6. Restore age key for secrets (sops-nix)

Secrets (e.g. `~/.aws/config`) are encrypted with [sops-nix](https://github.com/Mic92/sops-nix) using an age key stored in 1Password.

1. Retrieve the age private key from 1Password
2. Restore it to the correct location:

```sh
mkdir -p ~/.config/sops/age
# paste the key content saved in 1Password
vim ~/.config/sops/age/keys.txt
```

`darwin-rebuild switch` will then automatically decrypt and place all secrets.

### 7. SSH key setup (after 1Password sign-in)

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
| AWS CLI + config (SSO) | Nix (home-manager) + sops-nix |
| Google Chrome | Homebrew cask |
| VSCode app | Homebrew cask |
| 1Password | Homebrew cask |
| Codex App | Homebrew cask |
| Raycast | Homebrew cask |

## Adding a new machine

Add a new entry in `flake.nix` under `darwinConfigurations` with the machine's hostname (`hostname -s`).
