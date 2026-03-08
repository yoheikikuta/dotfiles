{ pkgs, lib, ... }: {
  home.username = "yoheikikuta";
  home.homeDirectory = lib.mkForce "/Users/yoheikikuta";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    claude-code
  ];

  programs.git = {
    enable = true;
    userName = "yoheikikuta";
    userEmail = "diracdiego@gmail.com";
  };

  programs.home-manager.enable = true;
}
