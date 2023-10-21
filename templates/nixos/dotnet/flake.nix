{
  description = "Default template for a .NET and JavaScript development environment.";

  inputs = {nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";};

  outputs = {
    self,
    nixpkgs-unstable,
  }: let
    overlays = [
      (final: prev: rec {
        nodejs = prev.nodejs-18_x;
        pnpm = prev.nodePackages.pnpm;
        yarn = prev.yarn.override {inherit nodejs;};
      })
    ];

    system = "x86_64-linux";

    unstable = import nixpkgs-unstable {inherit overlays system;};
  in {
    devShells.${system}.default = unstable.mkShell {
      packages = with unstable; [
        (with pkgs.dotnetCorePackages;
            combinePackages [sdk_6_0 sdk_7_0 sdk_8_0])
        mono
        msbuild
        nodejs-18_x
        omnisharp-roslyn
        pnpm
        yarn
      ];
    };
  };
}
