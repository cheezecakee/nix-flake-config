{ config, pkgs, ... }:

{
  users.groups.cheeze = {};
  users.users.cheeze = {
    isNormalUser = true;
    description = "cheezecake";
    uid = 1000;
    group = "cheeze";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    home = "/home/cheeze";
    shell = pkgs.bash;
    createHome = true;
    packages = with pkgs; [ ];
  };
}
