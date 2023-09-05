{
  description =
    "Default template for a .NET and JavaScript development environment.";

  inputs = { nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs-unstable }:
    let
      overlays = [
        (final: prev: rec {
          nodejs = prev.nodejs-18_x;
          pnpm = prev.nodePackages.pnpm;
          yarn = (prev.yarn.override { inherit nodejs; });
        })
      ];

      system = "aarch64-darwin";

      unstable = import nixpkgs-unstable { inherit overlays system; };
    in {
      devShells.${system}.default = unstable.mkShell {
        packages = with unstable; [ nodejs-18_x pnpm yarn ];
      };
    };
}
