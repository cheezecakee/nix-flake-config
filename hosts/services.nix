{ config, pkgs, ... }:

{
  # Nvidia graphics setup
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    open = false;
    nvidiaSettings = true;
    nvidiaPersistenced = true;
    modesetting.enable = true;
    dynamicBoost.enable = false;
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:14:0:0";
      intelBusId = "PCI:0:2:0"; #For INTEL GPU
      #  amdgpuBusId = "PCI:54:0:0}"; #For AMD GPU
    };
  };
  hardware.nvidia-container-toolkit.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Auto mount usb
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

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

  # Nerdfonts 
  fonts.fontconfig.enable = true;
}
