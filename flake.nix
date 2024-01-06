{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: Add nix-autobahn to system packages
    nix-autobahn = builtins.fetchGit {
      url = "https://github.com/Lassulus/nix-autobahn";
      ref = "master";
      rev = "9122088c5d58ca86b26ee4eda9ce6745f2c9555e";
    };
    
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-ld, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/desktop/configuration.nix
            inputs.home-manager.nixosModules.default

            nix-ld.nixosModules.nix-ld
            { programs.nix-ld.dev.enable = true; }
          ];
        };
    };
}
