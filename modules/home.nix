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
    settings = {
      commit.gpgsign = true;
      user.signingKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDkCkwlP4g9fje5DKsPmLv4XYPr+aFreDLJkzoENd0Q4Pjy4HBgucYKoPMP99lqdwbPo/F8AbXVSGX/xe5Jq41ptQVwQAAWBAsi0kUtiBpGjEoCdsP7MxJierFsZTEm0zOXd/qTMdDAbes242mUYP4nCjlmPV+Pcid5KBlXzwVkqxf3PhSE8Qp09mQqbb9Z8shlHSESkpHALnodkYmFVHg5ffeKssHZqnu3Qy05WPMLEjrXXVMaqFCFYJ0XlR5S54eDsYRV/lZiYju38MliUBEPgaGQ2Y0rjUPuShomHFEP4FYymeShS/Wt7v1GHerfkuvpLz/HI+WomxMabOEGo5KqAjQyzyW+0UOgX7NXvo6XK2Ujsca8QYTADe+B86sxRqcq46wDhh9j+7XlnbbRle6FRG/PjG9tE0SieNCmYnmDUaOh8apGRvP7srhA6WAx/QZMIW4J3ffAO8Dq9ZEdGsR0BQA+yq+d40aWpAoIwZSJ8YCkRHfm5vRPWZceazNKxD8=";
      gpg = {
        format = "ssh";
        ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
    };
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };

  programs.home-manager.enable = true;
}
