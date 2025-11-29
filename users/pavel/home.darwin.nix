{config, home, pkgs, lib, inputs, ... }:

{
  programs.zsh.shellAliases = {
    "darwin-switch" = "sudo darwin-rebuild switch --flake ~/.nix";
    "ds" = "darwin-switch";
    "darwin-edit" = "cd ~/.nix && nvim . && cd - > /dev/null";
    "de" = "darwin-edit";
  };

  imports = [
    ./home.nix
  ];
}
