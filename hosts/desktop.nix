{ config, pkgs, ... }:

{
  # Enable Wayland and Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # xwayland can be disabled.
  };

  programs.uwsm.enable = true;


  # Enable X server 
  services.xserver.enable = true;
  services.displayManager = {
    # startx.enable = true; # Launching the session from the TTY
    sddm.enable = true;
    sddm.wayland.enable = true;
    defaultSession = "hyprland-uwsm";
  };

  # Enable elogind for session management
  services.dbus.enable = true;

  # Enable xdg portal for screen capture from Wayland
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk # Fallback for some applications
    ];
    config.common.default = "*";
    config.hyprland.default = [ "hyprland" "gtk" ];
  };
}
