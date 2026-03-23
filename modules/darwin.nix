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
    InitialKeyRepeat = 15;
  };

  # Trackpad tracking speed (default 1.0, System Preferences max is 3.0)
  system.defaults.NSGlobalDomain."com.apple.trackpad.scaling" = 5.0;

  # Tap to click
  system.defaults.trackpad.Clicking = true;
  system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;

  # Dock
  system.defaults.dock = {
    autohide = true;
    tilesize = 16;
    # Hot corner: bottom-left -> screen saver
    wvous-bl-corner = 5;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];

  # nix-darwin requires this
  system.stateVersion = 5;
}
