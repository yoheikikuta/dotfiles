{ pkgs, lib, ... }: {
  home.username = "yoheikikuta";
  home.homeDirectory = lib.mkForce "/Users/yoheikikuta";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    claude-code
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "yoheikikuta";
      user.email = "diracdiego@gmail.com";
      user.signingKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDkCkwlP4g9fje5DKsPmLv4XYPr+aFreDLJkzoENd0Q4Pjy4HBgucYKoPMP99lqdwbPo/F8AbXVSGX/xe5Jq41ptQVwQAAWBAsi0kUtiBpGjEoCdsP7MxJierFsZTEm0zOXd/qTMdDAbes242mUYP4nCjlmPV+Pcid5KBlXzwVkqxf3PhSE8Qp09mQqbb9Z8shlHSESkpHALnodkYmFVHg5ffeKssHZqnu3Qy05WPMLEjrXXVMaqFCFYJ0XlR5S54eDsYRV/lZiYju38MliUBEPgaGQ2Y0rjUPuShomHFEP4FYymeShS/Wt7v1GHerfkuvpLz/HI+WomxMabOEGo5KqAjQyzyW+0UOgX7NXvo6XK2Ujsca8QYTADe+B86sxRqcq46wDhh9j+7XlnbbRle6FRG/PjG9tE0SieNCmYnmDUaOh8apGRvP7srhA6WAx/QZMIW4J3ffAO8Dq9ZEdGsR0BQA+yq+d40aWpAoIwZSJ8YCkRHfm5vRPWZceazNKxD8=";
      core.editor = "vim -c \"set fenc=utf-8\"";
      commit.gpgsign = true;
      gpg = {
        format = "ssh";
        ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {};
    extraConfig = ''
      Host *
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };

  home.activation.installVSCodeExtensions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if command -v code &> /dev/null; then
      while IFS= read -r ext; do
        $DRY_RUN_CMD code --install-extension "$ext" --force
      done < ${../config/vscode-extensions.txt}
    fi
  '';

  home.file."Library/Application Support/Code/User/settings.json" = {
    source = ../config/vscode-settings.json;
    force = true;
  };

  programs.home-manager.enable = true;
}
