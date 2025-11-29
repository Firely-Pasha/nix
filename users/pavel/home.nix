
{config, home, pkgs, lib, inputs, ... }:

{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ 
      inputs.rust-overlay.overlays.default 
    ];
  };

  home.username = "pavel";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
  ];

  imports = builtins.concatMap import [
    ../../modules/common
    ./modules
  ];
  
  programs.git = {
    settings.user.name = "pavel";
    settings.user.email = "tiddiebiter@gmail.com";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    ZSH_DISABLE_COMPFIX = "true";
  };

  programs.home-manager.enable = true;
}
