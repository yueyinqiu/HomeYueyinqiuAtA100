{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
    };
    
    nur = {
      url = "github:nix-community/NUR";
    };
    
    nix-airgap = {
      url = "github:bitbloxhub/nix-airgap";
    };
  };

  outputs = inputs: {
    homeConfigurations."yueyinqiu@a100" =
      let
        system = "x86_64-linux";
      in
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          nur = inputs.nur.legacyPackages.${system}.repos;
        };
        modules = [
          ./src
        ];
      };

    devShells = inputs.nixpkgs.lib.genAttrs inputs.nixpkgs.lib.systems.flakeExposed (system: {
      default = import ./dev {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        nix-airgap = inputs.nix-airgap.packages.${system};
      };
    });
  };
}
