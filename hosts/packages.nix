{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ## Text Editor
    neovim
    obsidian

    ## Terminal
    ghostty       # Terminal

    ## Driver 
    wl-clipboard  # Clipboard support for Wayland
    pavucontrol   # Audio control
    udisks2

    waybar        # Status bar for Hyprland
    rofi
    
    ## Programs 
    discord
    vlc  	  # Video player
    obs-studio    # Video streaming | recording

    ## Dev
    bun 	  # Package manager
    git
    go
    nodejs
    gcc 
    clang
    cmake
    zig
    lua
    stylua
    luaPackages.luacheck
    lua-language-server
    python3
    unzip

    # Screen sharing 
    cudatoolkit

    # Battery
    power-profiles-daemon

    # Ricing
    swww
    hyprshot
    hyprpaper
    eww
    jq
    socat

    # Tunnel
    cloudflared

    # DB
    postgresql

    # Zed Broswer
    appimage-run
  ];
}
