{ config, home-manager, pkgs, nixpkgs, inputs, outputs, rust-overlay, ... }:
let
  user = "pavel";
in
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

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };
  
  users.users.joseph = {
    name = "joseph";
    home = "/Users/joseph";
    isHidden = false;
    shell = pkgs.zsh;
  };

  system.stateVersion = 6;

  homebrew = {
    enable = true;
    brews = pkgs.callPackage ./brews.nix {};
    casks = pkgs.callPackage ./casks.nix {};
    onActivation = {
      upgrade = true;
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      ${user} = import ../../users/pavel/home.nix;
      joseph = import ../../users/joseph/home.nix;
    };
  };

}
