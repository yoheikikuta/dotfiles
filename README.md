# dotfiles

Nix-based dotfiles for macOS (nix-darwin + home-manager).

## Setup From Scratch

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

### 4. Restore age key for secrets

Secrets, such as `~/.aws/config`, are encrypted with [sops-nix](https://github.com/Mic92/sops-nix) using an age key stored in 1Password.

Restore the age private key before running `darwin-rebuild`, otherwise secret activation will fail.

```sh
mkdir -p ~/.config/sops/age
# paste the key content saved in 1Password
vim ~/.config/sops/age/keys.txt
```

### 5. Install nix-darwin

The configuration name in `flake.nix` must match `hostname -s`. If it does not, add or rename an entry under `darwinConfigurations` first.

For the first activation:

```sh
sudo nix run nix-darwin -- switch --flake .
```

For subsequent updates:

```sh
sudo /run/current-system/sw/bin/darwin-rebuild switch --flake .
```

### 6. SSH key setup

SSH authentication and commit signing are managed via 1Password SSH agent.

1. Open 1Password → Settings → Developer → enable **SSH Agent**
2. Import your SSH key into 1Password (New item → SSH Key)
3. Register the public key on GitHub:
   - **Authentication Key**: Settings → SSH and GPG keys → New SSH key
   - **Signing Key**: Settings → SSH and GPG keys → New SSH key (Key type: Signing Key)

Once done, SSH access and signed commits work automatically.

## Daily Usage

Check the flake:

```sh
nix flake check --show-trace
```

Apply changes:

```sh
sudo /run/current-system/sw/bin/darwin-rebuild switch --flake .
```

Update flake inputs:

```sh
nix flake update
```

## Adding A New Machine

Add a new entry in `flake.nix` under `darwinConfigurations` with the machine's hostname (`hostname -s`).
