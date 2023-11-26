{
  description = "Default template for a Deno development environment.";

  inputs = {nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";};

  outputs = {
    self,
    nixpkgs-unstable,
  }: let
    system = "aarch64-darwin";

    unstable = import nixpkgs-unstable {inherit system;};
  in {
    devShells.${system}.default = unstable.mkShell {
      packages = with unstable; [deno];
    };
  };
}
