{ config, pkgs, ... }:

{
  # Private database configuration
  services.postgresql = {
    ensureDatabases = [ "fitrkr" ];
    ensureUsers = [
      {
        name = "cheezecake";
        ensureDBOwnership = false;
      }
    ];
    authentication = ''
      local all all trust
    '';
  };
}
