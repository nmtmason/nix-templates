# nix-templates

Nix flake templates for easy dev environments.

To initialize:

```bash
nix flake init --template github:nmtmason/nix-templates#{ENV}
```

Where `ENV` is one of the following:

- `darwin.deno`
- `darwin.dotnet`
- `darwin.dotnet5`
- `darwin.dotnet3`
- `darwin.nix`
- `darwin.node`
- `nixos.dotnet`
- `nixos.dotnet5`
- `nixos.dotnet3`
- `nixos.node`

Or create a new project:

```bash
nix flake new --template github:nmtmason/nix-templates#{ENV} ${NEW_PROJECT_DIRECTORY}
```

## Improvements

- [ ] Combine `darwin` and `nixos` directories.

## Notes

How to set a specific version of yarn?

```
yarn set version 3.x
```
