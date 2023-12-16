{
  description = "Ready-made templates for easily creating flake-driven environments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    templates = {
      darwin = {
        deno = {
          path = ./templates/darwin/deno;
          description = "Deno development environment";
        };

        dotnet = {
          path = ./templates/darwin/dotnet;
          description = ".NET 6 / 7 / 8 development environment";
        };

        dotnet3 = {
          path = ./templates/darwin/dotnet3;
          description = ".NET 3 development environment";
        };

        dotnet5 = {
          path = ./templates/darwin/dotnet5;
          description = ".NET 5 development environment";
        };

        dotnet5 = {
          path = ./templates/darwin/nix;
          description = "Nix development environment";
        };

        node = {
          path = ./templates/darwin/node;
          description = "Node.js development environment";
        };
      };
      nixos = {
        dotnet = {
          path = ./templates/nixos/dotnet;
          description = ".NET 6 / 7 / 8 development environment";
        };

        dotnet3 = {
          path = ./templates/nixos/dotnet3;
          description = ".NET 3 development environment";
        };

        dotnet5 = {
          path = ./templates/nixos/dotnet5;
          description = ".NET 5 development environment";
        };

        node = {
          path = ./templates/nixos/node;
          description = "Node.js development environment";
        };
      };
    };
  };
}
