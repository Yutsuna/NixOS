{
  description = "YutsuOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-code-nix.url = "github:sadjow/claude-code-nix";
    claude-code-nix.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      claude-code-nix,
      sops-nix,
      ...
    }:
    let
      vars = import ./Config.nix;
      system = "${vars.system.architecture}";
      yutsuLib = import ./Lib { inherit (nixpkgs) lib; };
    in
    {

      nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit
            claude-code-nix
            self
            vars
            yutsuLib
            ;
        };
        modules = [
          sops-nix.nixosModules.sops
          ./System
          home-manager.nixosModules.home-manager
          ./Home
        ];
      };
    };
}
