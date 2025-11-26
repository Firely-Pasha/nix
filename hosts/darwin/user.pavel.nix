{ config, home-manager, pkgs, nixpkgs, inputs, outputs, rust-overlay, ... }:
let 
  user = "pavel";
in
{
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };
  
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      ${user} = import ../../users/${user}/home.darwin.nix;
    };
  };
}
