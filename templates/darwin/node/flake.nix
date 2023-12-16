{
  description = "Default template for a .NET and JavaScript development environment.";

  inputs = {nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";};

  outputs = {
    self,
    nixpkgs,
  }: let
    overlays = [
      (final: prev: rec {
        nodejs = prev.nodejs-18_x;
        pnpm = prev.nodePackages.pnpm;
        yarn = prev.yarn.override {inherit nodejs;};
      })
    ];

    system = "aarch64-darwin";

    pkgs = import nixpkgs {inherit overlays system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [nodejs-18_x pnpm yarn];
    };
  };
}
