{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ## Text Editor
    neovim
    obsidian

    ## Terminal
    ghostty # Terminal

    ## Driver 
    wl-clipboard # Clipboard support for Wayland
    pavucontrol # Audio control
    udisks2

    waybar # Status bar for Hyprland
    rofi
    libnotify

    ## Tools
    tree
    sbctl

    ## Programs 
    discord
    vlc # Video player
    obs-studio # Video streaming | recording

    ## Dev
    android-studio
    bun # Package manager
    cargo
    clang
    cmake
    gcc
    git
    go
    lua
    lua-language-server
    luaPackages.luacheck
    nodejs
    python3
    stylua
    unzip
    zig

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

    # Display
    hyprshade
  ];
}
