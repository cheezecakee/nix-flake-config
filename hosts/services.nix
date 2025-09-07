{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Auto mount usb
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.flatpak.enable = true;

  # Power profiles daemon
  services.power-profiles-daemon.enable = true;

  # VNC setup 
  services.xrdp.enable = true;

  # Enable PipeWire/NVIDIA/Audio for screen capture
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  services.openssh.enable = true;


  services.postgresql = {
    enable = true;
    ensureDatabases = [ "fitrkr" ]; # your actual DB name
    ensureUsers = [
      {
        name = "cheezecake";
        # remove ensureDBOwnership or set false to avoid the error
        ensureDBOwnership = false;
      }
    ];
    authentication = ''
      local all all trust
    '';
  };

  services.mongodb.enable = false;

  virtualisation.docker.enable = true;

  # Music 
  services.mpd = {
      enable = true;
      musicDirectory = "/path/to/music";
      extraConfig = ''
        audio_output {
          type "pulse"
          name "PulseAudio"
        }
      '';

      # Optional:
      network.listenAddress = "any"; # if you want to allow non-localhost connections
      network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  }
}
