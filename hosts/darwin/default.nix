{ config, home-manager, pkgs, nixpkgs, inputs, outputs, ... }:
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

  system.stateVersion = 6;

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      ${user} = import ../../users/pavel/home.nix;
    };
  };

}
