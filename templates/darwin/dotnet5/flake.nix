{
  description = "Default template for a .NET and JavaScript development environment.";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable-2211.url = "github:nixos/nixpkgs/nixos-22.11";
  };

  outputs = {
    self,
    nixpkgs-unstable,
    nixpkgs-stable-2211,
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

    unstable = import nixpkgs-unstable {inherit overlays system;};
    stable-2211 = import nixpkgs-stable-2211 {system = fallbackSystem;};

    unstablePackages = with unstable; [nodejs-18_x pnpm yarn];
    stable2211Packages = with stable-2211; [dotnet-sdk_5];
  in {
    devShells.${system}.default =
      unstable.mkShell {packages = unstablePackages ++ stable2211Packages;};
  };
}
