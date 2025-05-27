{
  description =
    "NixOS system for development, compatible with various installations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, disko, ... }: {
    nixosConfigurations."NixOS-TUXEDO-Sirius-16-Gen2" =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./hosts/NixOS-TUXEDO-Sirius-16-Gen2.nix {
            inherit home-manager disko;
            pkgs = import nixpkgs { system = "x86_64-linux"; };
          })
        ];
      };
    nixosConfigurations."NixOS-VirtualBox" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        (import ./hosts/NixOS-VirtualBox.nix {
          inherit home-manager disko;
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        })
      ];
    };
  };
}
