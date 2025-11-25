{config, home, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    flutter
  ];
}
