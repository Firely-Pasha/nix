
{config, home, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "pavel";

  home.stateVersion = "25.05";

  home.packages = [];

  imports = builtins.concatMap import [
    ../../modules/common
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
