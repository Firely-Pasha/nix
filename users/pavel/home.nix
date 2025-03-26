
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
    userName  = "pavel";
    userEmail = "tiddiebiter@gmail.com";
  };


  programs.zsh.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake ~/.nix";
    darwin-switch = "darwin-rebuild switch --flake ~/.nix";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
