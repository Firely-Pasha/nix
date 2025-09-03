{config, home, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ghostty
    kitty
    nerd-fonts.ubuntu-mono
    nerd-fonts.jetbrains-mono
    flutter
    temurin-bin
  ];
  home.shellAliases = {
    "home-switch" = "home-manager --flake ~/.nix --extra-experimental-features 'nix-command flakes' switch";
    "hs" = "home-switch";
    "home-edit" = "cd ~/.nix && nvim . && cd - > /dev/null";
    "he" = "home-edit";
  };
}
