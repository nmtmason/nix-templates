# nix-templates

Nix flake templates for easy dev environments.

To initialize:

```bash
nix flake init --template github:nmtmason/nix-templates#{ENV}
```

Where `ENV` is one of the following:

- darwin.dotnet
- darwin.dotnet5
- darwin.dotnet3
- darwin.node
- nixos.dotnet
- nixos.dotnet5
- nixos.dotnet3
- nixos.node

Or create a new project:

```bash
nix flake new --template github:nmtmason/nix-templates#{ENV} ${NEW_PROJECT_DIRECTORY}
```
