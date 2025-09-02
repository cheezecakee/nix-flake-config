{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./users.nix
      ./editors.nix
      ./desktop.nix
      ./services.nix
      ./packages.nix
      ./display.nix
      ./fonts.nix
      ./zen.nix
      ./themes.nix
    ];

  # Enable nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos"; # Define your hostname.

  # Bootloader.
  boot.loader = {
    grub.enable = false;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.blacklistedKernelModules = [ "nouveau" ];
  # boot.lanzaboote.enable = true;
  # boot.lanzaboote.pki.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  console.keyMap = "us"; # For Wayland sessions (including Hyprland)

  system.stateVersion = "25.05"; # Did you read the comment?

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable automatic login for the user.
  # services.getty.autologinUser = "cheeze";

  # Mount HDD
  fileSystems."/mnt/work" = {
    device = "/dev/disk/by-uuid/CA96A59396A58095";
    fsType = "ntfs-3g";
    options = [ "defaults" "uid=1000" "gid=100" "umask=022" ];
  };
}
