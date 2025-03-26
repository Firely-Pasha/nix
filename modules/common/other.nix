{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    nodejs
    bun
    lazygit
  ];
}
