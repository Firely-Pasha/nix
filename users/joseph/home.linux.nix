{config, home, pkgs, lib, ... }:

{
  home.homeDirectory = "/home/joseph";
  home.packages = with pkgs; [
    flutter
  ];
}
