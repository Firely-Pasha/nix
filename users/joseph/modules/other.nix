{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    pnpm
    bun
    ruby
    ruby.gems.nokogiri
  ];
}
