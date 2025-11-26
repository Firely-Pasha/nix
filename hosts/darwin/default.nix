{ config, home-manager, pkgs, nixpkgs, inputs, outputs, rust-overlay, ... }:
{
  nix = {
    enable = false;
    # useDaemon = true;
    # gc = {
    #   automatic = true;
    #   interval = {
    #     Weekday = 0;
    #     Hour = 0;
    #     Minute = 0;
    #   };
    #   options = "--delete-older-than 7d";
    # };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.zsh.enable = true;

  system.stateVersion = 6;
  system.primaryUser = "pavel";

  homebrew = {
    enable = true;
    brews = pkgs.callPackage ./brews.nix {};
    casks = pkgs.callPackage ./casks.nix {};
    onActivation = {
      upgrade = true;
    };
  };

  imports = [
    ./user.pavel.nix
    ./user.joseph.nix
  ];

}
