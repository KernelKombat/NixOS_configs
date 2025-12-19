{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, nixpkgs-stable,  ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

  in {
    nixosConfigurations.nix-studio = nixpkgs.lib.nixosSystem {
      inherit system;
       specialArgs = {
       stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
          };
       };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
