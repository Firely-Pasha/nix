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
    userName  = "joseph";
    userEmail = "pz@parking24.online";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
