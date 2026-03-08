{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  system.primaryUser = "yoheikikuta";

  # Determinate Nix manages the Nix installation itself
  nix.enable = false;

  # Homebrew for GUI apps and tools not in nixpkgs
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # "zap" removes all unlisted casks/brews for full declarative management
      cleanup = "zap";
    };
    casks = [
      "google-chrome"
      "visual-studio-code"
      "1password"
      "codex-app"
    ];
    brews = [];
  };

  # nix-darwin requires this
  system.stateVersion = 5;
}
