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
      "cmux"
      "visual-studio-code"
      "1password"
      "codex-app"
      "raycast"
    ];
    brews = [];
  };

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  system.defaults.NSGlobalDomain = {
    # Key repeat rate (lower = faster, default 2 = 30ms)
    KeyRepeat = 1;
    # Delay before key repeat starts (lower = faster, default 15 = 225ms)
    InitialKeyRepeat = 5;
  };

  # Mouse tracking speed (0.0 - 3.0, default 1.0)
  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 2.5;

  # nix-darwin requires this
  system.stateVersion = 5;
}
