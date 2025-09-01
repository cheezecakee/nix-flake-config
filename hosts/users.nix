{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cheeze = {
    isNormalUser = true;
    description = "cheezecake";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];

    # User-specific environment variables
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      SUDO_EDITOR = "nvim";
    };
  };
}
