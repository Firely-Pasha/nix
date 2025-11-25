{config, home, pkgs, lib, inputs, ... }:

{
  programs.zsh.shellAliases = {
    ds = "darwin-rebuild switch --flake ~/.nix";
  };
}
