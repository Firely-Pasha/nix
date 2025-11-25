{config, home, pkgs, lib, ... }:
{
  home.homeDirectory = "/home/pavel";
  home.shellAliases = {
    "home-switch" = "home-manager --flake ~/.nix#pavel@linux --extra-experimental-features 'nix-command flakes' switch";
    "hs" = "home-switch";
    "home-edit" = "cd ~/.nix && nvim . && cd - > /dev/null";
    "he" = "home-edit";
  };
}

