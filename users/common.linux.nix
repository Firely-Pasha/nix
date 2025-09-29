{config, home, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ghostty
    nerd-fonts.ubuntu-mono
    nerd-fonts.jetbrains-mono
    temurin-bin
  ];
  home.shellAliases = {
    "hs" = "home-switch";
    "home-edit" = "cd ~/.nix && nvim . && cd - > /dev/null";
    "he" = "home-edit";
  };
}
