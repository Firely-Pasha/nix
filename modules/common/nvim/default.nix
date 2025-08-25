{config, pkgs, lib, inputs, ... }:

{
  home.file = {
    ".config/nvim".source = ./nvim;
  };
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true; 
  };
}
