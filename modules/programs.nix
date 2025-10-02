{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Text Editors & Note Taking
    obsidian

    # Terminal
    ghostty

    # Communication
    discord

    # Media
    vlc
    obs-studio
    spotify

    # Development IDEs
    android-studio

    # Gaming
    steam

    # Utilities
    pavucontrol  # Audio control GUI
  ];
}
