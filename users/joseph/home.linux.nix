{config, home, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ghostty
    kitty
    nerd-fonts.ubuntu-mono
    nerd-fonts.jetbrains-mono
    flutter
    android-sdk
  ];
}
