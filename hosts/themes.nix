{ config, pkgs, ... }:

# add ONLY this block (or merge into an existing let/in) in configuration.nix
let
  sddmAstronaut = pkgs.stdenv.mkDerivation {
    pname = "sddm-astronaut-theme";
    version = "1.0";
    src = /home/cheeze/.local/share/sddm/themes/sddm-astronaut-theme; # <- update if needed
    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-astronaut-theme
      cp -r ./* $out/share/sddm/themes/sddm-astronaut-theme/
    '';
  };
in
{
  environment.systemPackages = with pkgs; [
    sddmAstronaut
  ];

  # set SDDM theme to the folder name we installed
  services.displayManager.sddm.theme = "sddm-astronaut-theme";
}
