{
  description = "Ready-made templates for easily creating flake-driven environments";

  inputs = {nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";};

  outputs = {
    self,
    nixpkgs,
  }: {
    templates = {
      darwin = {
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
