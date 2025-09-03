{
  description = "Modular NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.2";
  };

  outputs = { self, nixpkgs, flake-utils, lanzaboote, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/default.nix
        lanzaboote.nixosModules.lanzaboote
      ];
    };
  };
}
