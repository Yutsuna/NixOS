{
  description = "YutsuOS Flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents.url = "github:numtide/llm-agents.nix";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    graphify = {
      url = "github:safishamsi/graphify";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      llm-agents,
      sops-nix,
      graphify,
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
            self
            vars
            yutsuLib
            llm-agents
            graphify
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
