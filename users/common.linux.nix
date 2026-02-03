{config, home, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ghostty
    nerd-fonts.ubuntu-mono
    nerd-fonts.jetbrains-mono
    temurin-bin
    gcc
    zip
    unzip
  ];
  home.shellAliases = {
    "hs" = "home-switch";
    "home-edit" = "cd ~/.nix && nvim . && cd - > /dev/null";
    "he" = "home-edit";
    "hu" = "cd ~/.nix && nix flake --extra-experimental-features 'nix-command flakes' update && cd - > /dev/null";
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
