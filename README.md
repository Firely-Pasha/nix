# Installation

### macOS

1. Install nix:

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

2. Run nix-darwin

```
nix run nix-darwin -- switch --flake .
```

3. Rebuild configuration with

```
darwin-rebuild switch --flake .
```
