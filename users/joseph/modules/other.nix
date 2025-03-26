{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    pnpm
    bun
  ];
}
