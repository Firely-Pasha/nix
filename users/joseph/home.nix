{config, home, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "joseph";
  home.stateVersion = "25.05";
  home.packages = [];

  imports = builtins.concatMap import [
    ../../modules/common
    ./modules
  ];

  programs.git = {
    settings.user.name = "joseph";
    settings.user.email = "pz@parking24.online";
  };

  programs.home-manager.enable = true;
}
