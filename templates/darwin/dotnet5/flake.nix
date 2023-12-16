{
  description = "Default template for a .NET and JavaScript development environment.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2211.url = "github:nixos/nixpkgs/nixos-22.11";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-2211,
  }: let
    overlays = [
      (final: prev: rec {
        nodejs = prev.nodejs-18_x;
        pnpm = prev.nodePackages.pnpm;
        yarn = prev.yarn.override {inherit nodejs;};
      })
    ];

    system = "aarch64-darwin";
    fallbackSystem = "x86_64-darwin";

    pkgs = import nixpkgs {inherit overlays system;};
    pkgs-2211 = import nixpkgs-2211 {system = fallbackSystem;};

    packages = with pkgs; [nodejs-18_x pnpm yarn];
    packages-2211 = with pkgs-2211; [dotnet-sdk_5];
  in {
    devShells.${system}.default =
      pkgs.mkShell {packages = packages ++ packages-2211;};
  };
}
